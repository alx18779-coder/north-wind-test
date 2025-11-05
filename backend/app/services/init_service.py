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


def _run_scripts(connection_url: str, paths: Iterable[Path]) -> None:
    engine = create_execution_engine(connection_url, timeout_seconds=settings.default_timeout_seconds)
    try:
        with engine.begin() as conn:
            for path in paths:
                sql = path.read_text(encoding="utf-8")
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
    _run_scripts(connection_url, scripts)


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
