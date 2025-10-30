"""Services for learner-facing practice endpoints."""
from __future__ import annotations

import hashlib
import time
from contextlib import contextmanager
from typing import Any, Dict, List

from fastapi import HTTPException, status
from sqlalchemy import text
from sqlalchemy.orm import Session

from backend.app.core import crypto
from backend.app.models import DatabaseInstance, ExecutionLog, Question
from backend.app.schemas.practice import PracticeQuestionDetail, PracticeQuestionSummary
from backend.app.services import database_instance_service, limits, question_service, settings_service
from backend.app.services.sql_validation import validate_read_only_sql


def list_published_questions(session: Session) -> List[PracticeQuestionSummary]:
    questions = question_service.list_published_questions(session)
    summaries: List[PracticeQuestionSummary] = []
    for q in questions:
        if not q.instance_tags:
            continue
        summaries.append(
            PracticeQuestionSummary(
                id=q.id,
                question_id=q.question_id,
                title=q.title,
                difficulty=q.difficulty,
                category=q.category,
                instance_tags=q.instance_tags,
            )
        )
    return summaries


def _fetch_published_question(session: Session, question_id: int) -> Question:
    question = question_service.get_question(session, question_id)
    if question is None or question.status != "published":
        raise HTTPException(status_code=status.HTTP_404_NOT_FOUND, detail="Question not available")
    return question


def get_published_question_detail(session: Session, question_id: int) -> PracticeQuestionDetail:
    question = _fetch_published_question(session, question_id)
    if not question.instance_tags:
        raise HTTPException(
            status_code=status.HTTP_400_BAD_REQUEST,
            detail="Question has no database instance tags configured",
        )
    hints = [hint.content for hint in question.hints]
    return PracticeQuestionDetail(
        id=question.id,
        question_id=question.question_id,
        title=question.title,
        difficulty=question.difficulty,
        category=question.category,
        instance_tags=question.instance_tags,
        description=question.description,
        required_fields=question.required_fields,
        hints=hints,
        notes=question.notes,
    )


def _find_instance_by_tag(session: Session, tag: str) -> DatabaseInstance:
    instance = database_instance_service.get_instance_by_tag(session, tag)
    if instance is None:
        raise HTTPException(status_code=status.HTTP_404_NOT_FOUND, detail="Database instance not found for tag")
    return instance


@contextmanager
def _create_connection(instance: DatabaseInstance, timeout_seconds: int):
    password = crypto.decrypt(instance.password_encrypted)
    url = database_instance_service.build_connection_url(instance, password)
    engine = database_instance_service.create_execution_engine(url, timeout_seconds=timeout_seconds)
    try:
        with engine.connect() as connection:
            yield connection
    finally:
        engine.dispose()


def execute_query(
    session: Session,
    question_id: int,
    sql: str,
    instance_tag: str,
    client_ip: str,
) -> Dict[str, Any]:
    settings = settings_service.get_settings(session)
    rate_limit = settings["rate_limit_per_minute"]
    allowed, retry_after = limits.rate_limiter.check(client_ip, rate_limit)
    if not allowed:
        raise HTTPException(status_code=status.HTTP_429_TOO_MANY_REQUESTS, detail=f"Rate limit exceeded. Retry in {int(retry_after or 0)}s")

    question = _fetch_published_question(session, question_id)
    if instance_tag not in question.instance_tags:
        raise HTTPException(status_code=status.HTTP_400_BAD_REQUEST, detail="Instance tag not allowed for this question")

    try:
        validate_read_only_sql(sql)
    except ValueError as exc:
        raise HTTPException(status_code=status.HTTP_400_BAD_REQUEST, detail=str(exc))

    instance = _find_instance_by_tag(session, instance_tag)
    max_rows = settings["default_max_rows"]
    concurrency_limit = settings["default_concurrency_limit"]

    start_time = time.perf_counter()
    status_value = "success"
    error_message = None
    row_count = 0
    truncated = False
    rows: List[Dict[str, Any]] = []
    columns: List[str] = []

    with limits.concurrency_limiter.acquire(str(instance.id), concurrency_limit):
        try:
            with _create_connection(instance, settings["default_timeout_seconds"]) as connection:
                result = connection.execution_options(stream_results=True).execute(text(sql))
                columns = list(result.keys())
                mapping_cursor = result.mappings()
                for _ in range(max_rows + 1):
                    row = mapping_cursor.fetchone()
                    if row is None:
                        break
                    row_count += 1
                    if row_count > max_rows:
                        truncated = True
                        break
                    rows.append(dict(row))
        except HTTPException:
            raise
        except Exception as exc:  # pragma: no cover - database errors
            status_value = "error"
            error_message = str(exc)
            rows = []
            columns = []

    elapsed = int((time.perf_counter() - start_time) * 1000)

    log = ExecutionLog(
        question_id=question.id,
        instance_tag=instance_tag,
        submitted_sql=sql,
        sql_hash=hashlib.sha256(sql.encode("utf-8")).hexdigest(),
        status=status_value,
        row_count=row_count if status_value == "success" else None,
        truncated=truncated,
        execution_time_ms=elapsed if status_value == "success" else None,
        error_message=error_message,
        client_ip=client_ip,
    )
    session.add(log)
    session.commit()

    if status_value != "success":
        raise HTTPException(status_code=status.HTTP_400_BAD_REQUEST, detail=error_message or "Query failed")

    return {
        "columns": columns,
        "rows": rows,
        "truncated": truncated,
        "execution_time_ms": elapsed,
    }


def list_execution_history(session: Session, client_ip: str, limit: int = 20) -> List[ExecutionLog]:
    return (
        session.query(ExecutionLog)
        .filter(ExecutionLog.client_ip == client_ip)
        .order_by(ExecutionLog.created_at.desc())
        .limit(limit)
        .all()
    )


def get_reference_answer(session: Session, question_id: int, instance_tag: str) -> str:
    question = _fetch_published_question(session, question_id)
    if instance_tag not in question.instance_tags:
        raise HTTPException(status_code=status.HTTP_400_BAD_REQUEST, detail="Instance tag not allowed for this question")
    for reference in question.reference_sql:
        if reference.engine == instance_tag:
            return reference.sql_text
    instance = _find_instance_by_tag(session, instance_tag)
    for reference in question.reference_sql:
        if reference.engine == instance.engine:
            return reference.sql_text
    raise HTTPException(status_code=status.HTTP_404_NOT_FOUND, detail="Reference answer unavailable for instance")
