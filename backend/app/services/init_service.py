"""Services for database initialization jobs."""
from __future__ import annotations

from datetime import datetime, timezone
from pathlib import Path
from typing import Iterable

from sqlalchemy.orm import Session

from backend.app.core import crypto
from backend.app.core.config import settings
from backend.app.models import DatabaseInstance, DbInitJob
from backend.app.services.database_instance_service import build_connection_url, create_execution_engine
from backend.app.services.log_service import record_audit_log


def _script_paths_for_instance(instance: DatabaseInstance) -> Iterable[Path]:
    if instance.engine == "postgres":
        return [Path(settings.northwind_pg_script_path)]
    if instance.engine == "mysql":
        # Prefer consolidated MySQL script converted from PG if present
        consolidated = Path("infrastructure/sql/northwind_mysql.sql")
        if consolidated.exists():
            return [consolidated]
        # Fallback to legacy split schema/data scripts
        return [
            Path(settings.northwind_mysql_schema_path),
            Path(settings.northwind_mysql_data_path),
        ]
    raise ValueError(f"Unsupported engine: {instance.engine}")


def _ensure_scripts_exist(paths: Iterable[Path]) -> None:
    missing = [str(path) for path in paths if not path.exists()]
    if missing:
        raise FileNotFoundError("Missing initialization scripts: " + ", ".join(missing))


def _split_sql_statements(sql: str) -> list[str]:
    """Split SQL script into individual statements, respecting strings and comments.

    Handles:
    - Single-line comments: -- ... and # ...
    - Block comments: /* ... */
    - String literals: '...' and "..." (no dollar-quoting as not used here)
    """
    stmts: list[str] = []
    buf: list[str] = []
    i = 0
    n = len(sql)
    in_single = False
    in_double = False
    in_line_comment = False
    in_block_comment = False
    while i < n:
        ch = sql[i]
        nxt = sql[i + 1] if i + 1 < n else ''
        # Handle exiting comments
        if in_line_comment:
            if ch == '\n':
                in_line_comment = False
                buf.append(ch)
            i += 1
            continue
        if in_block_comment:
            if ch == '*' and nxt == '/':
                i += 2
                in_block_comment = False
            else:
                i += 1
            continue
        # Enter comments (only when not in string)
        if not in_single and not in_double:
            if ch == '-' and nxt == '-':
                in_line_comment = True
                # skip the rest of the line
                i += 2
                # normalize MySQL requirement: '-- ' has a space; keep comment but do not include in statement buffer
                while i < n and sql[i] != '\n':
                    i += 1
                continue
            if ch == '#':
                in_line_comment = True
                i += 1
                while i < n and sql[i] != '\n':
                    i += 1
                continue
            if ch == '/' and nxt == '*':
                in_block_comment = True
                i += 2
                continue
        # Strings
        if ch == "'" and not in_double:
            in_single = not in_single
            buf.append(ch)
            i += 1
            continue
        if ch == '"' and not in_single:
            in_double = not in_double
            buf.append(ch)
            i += 1
            continue
        # Statement terminator
        if ch == ';' and not in_single and not in_double:
            stmt = ''.join(buf).strip()
            if stmt:
                stmts.append(stmt)
            buf = []
            i += 1
            continue
        buf.append(ch)
        i += 1
    last = ''.join(buf).strip()
    if last:
        stmts.append(last)
    return stmts


def _normalize_for_mysql(sql: str) -> str:
    # Drop lines that start with '---' (PG dump separators) or convert to MySQL style comments
    lines: list[str] = []
    for raw in sql.splitlines():
        s = raw.lstrip()
        if s.startswith('---'):
            # replace with MySQL comment
            lines.append('# ' + s.lstrip('-').lstrip())
            continue
        lines.append(raw)
    return '\n'.join(lines)


def _run_scripts(connection_url: str, paths: Iterable[Path], engine_name: str) -> None:
    engine = create_execution_engine(connection_url, timeout_seconds=settings.default_timeout_seconds)
    try:
        with engine.begin() as conn:
            for path in paths:
                sql = path.read_text(encoding="utf-8")
                if engine_name == "mysql":
                    sql = _normalize_for_mysql(sql)
                    for stmt in _split_sql_statements(sql):
                        conn.exec_driver_sql(stmt)
                else:
                    if sql.strip():
                        conn.exec_driver_sql(sql)
    finally:
        engine.dispose()


def create_init_job(session: Session, instance: DatabaseInstance) -> DbInitJob:
    job = DbInitJob(instance_id=instance.id, status="queued")
    session.add(job)
    session.commit()
    session.refresh(job)
    return job


def _execute_job(session: Session, job: DbInitJob, instance: DatabaseInstance) -> None:
    scripts = list(_script_paths_for_instance(instance))
    _ensure_scripts_exist(scripts)
    password = crypto.decrypt(instance.password_encrypted)
    connection_url = build_connection_url(instance, password)
    _run_scripts(connection_url, scripts, instance.engine)


def run_init_job(session: Session, job: DbInitJob) -> DbInitJob:
    instance = session.get(DatabaseInstance, job.instance_id)
    if instance is None:
        job.status = "failed"
        job.completed_at = datetime.now(timezone.utc)
        job.log = "Database instance not found"
        session.add(job)
        session.commit()
        return job

    job.status = "running"
    job.log = None
    session.add(job)
    session.commit()

    try:
        _execute_job(session, job, instance)
        job.status = "completed"
        job.log = "Initialization completed successfully"
        record_audit_log(
            session,
            action="db_instance_init",
            target_type="database_instance",
            target_id=str(instance.id),
            success=True,
        )
    except Exception as exc:  # pragma: no cover - real execution errors
        job.status = "failed"
        job.log = str(exc)
        record_audit_log(
            session,
            action="db_instance_init",
            target_type="database_instance",
            target_id=str(instance.id),
            success=False,
            details={"error": str(exc)},
        )
    finally:
        job.completed_at = datetime.now(timezone.utc)
        # truncate overly long logs to avoid UI lag
        if job.log and len(job.log) > 131072:  # 128 KiB
            job.log = job.log[:131072] + "\n...(truncated)"
        session.add(job)
        session.commit()
        session.refresh(job)

    return job


def trigger_init_job(session: Session, instance: DatabaseInstance) -> DbInitJob:
    job = create_init_job(session, instance)
    from backend.app.init_worker import enqueue_job

    enqueue_job(job.id)
    return job


def list_jobs_for_instance(session: Session, instance_id: int) -> list[DbInitJob]:
    return (
        session.query(DbInitJob)
        .filter(DbInitJob.instance_id == instance_id)
        .order_by(DbInitJob.created_at.desc())
        .all()
    )


def run_init_job_by_id(session: Session, job_id: int) -> None:
    job = session.get(DbInitJob, job_id)
    if job is None:
        return
    run_init_job(session, job)
