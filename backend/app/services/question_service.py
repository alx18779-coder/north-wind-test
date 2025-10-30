"""Service layer for question management."""
from __future__ import annotations

from typing import Iterable, List

from sqlalchemy import select
from sqlalchemy.orm import Session

from backend.app.models import Question, QuestionHint, QuestionImportJob, QuestionReferenceSQL
from backend.app.schemas.question import (
    QuestionCreate,
    QuestionHintPayload,
    QuestionReferencePayload,
    QuestionUpdate,
)


def list_questions(session: Session) -> List[Question]:
    stmt = select(Question).order_by(Question.id)
    return list(session.scalars(stmt).unique())


def list_published_questions(session: Session) -> List[Question]:
    stmt = select(Question).where(Question.status == "published").order_by(Question.id)
    return list(session.scalars(stmt).unique())


def get_question(session: Session, question_id: int) -> Question | None:
    return session.get(Question, question_id)


def _build_references(payloads: Iterable[QuestionReferencePayload]) -> List[QuestionReferenceSQL]:
    return [
        QuestionReferenceSQL(engine=payload.engine, sql_text=payload.sql_text)
        for payload in payloads
    ]


def _build_hints(payloads: Iterable[QuestionHintPayload]) -> List[QuestionHint]:
    return [
        QuestionHint(display_order=payload.display_order, content=payload.content)
        for payload in payloads
    ]


def create_question(session: Session, payload: QuestionCreate) -> Question:
    question = Question(
        question_id=payload.question_id,
        title=payload.title,
        description=payload.description,
        required_fields=payload.required_fields,
        difficulty=payload.difficulty,
        category=payload.category,
        status=payload.status,
        instance_tags=payload.instance_tags,
        notes=payload.notes,
    )
    question.reference_sql = _build_references(payload.reference_sql)
    question.hints = _build_hints(payload.hints)

    session.add(question)
    session.commit()
    session.refresh(question)
    return question


def update_question(session: Session, question: Question, payload: QuestionUpdate) -> Question:
    data = payload.model_dump(exclude={"reference_sql", "hints"}, exclude_unset=True)
    reference_sql = payload.reference_sql
    hints = payload.hints

    for field, value in data.items():
        setattr(question, field, value)

    if reference_sql is not None:
        question.reference_sql.clear()
        session.flush()
        question.reference_sql.extend(_build_references(reference_sql))

    if hints is not None:
        question.hints.clear()
        session.flush()
        question.hints.extend(_build_hints(hints))

    session.add(question)
    session.commit()
    session.refresh(question)
    return question


def delete_question(session: Session, question: Question) -> None:
    session.delete(question)
    session.commit()


def export_questions(session: Session) -> list[Question]:
    return session.scalars(select(Question).order_by(Question.id)).unique().all()


def import_questions(session: Session, payload: list[QuestionCreate], admin_user_id: int | None = None) -> QuestionImportJob:
    job = QuestionImportJob(
        admin_user_id=admin_user_id,
        filename="api-upload",
        status="running",
        success_count=0,
        failure_count=0,
    )
    session.add(job)
    session.commit()
    session.refresh(job)

    success = 0
    failure = 0
    failures: list[dict[str, str]] = []

    for item in payload:
        try:
            question = Question(
                question_id=item.question_id,
                title=item.title,
                description=item.description,
                required_fields=item.required_fields,
                difficulty=item.difficulty,
                category=item.category,
                status=item.status,
                instance_tags=item.instance_tags,
                notes=item.notes,
            )
            question.reference_sql = _build_references(item.reference_sql)
            question.hints = _build_hints(item.hints)
            session.add(question)
            session.commit()
            success += 1
        except Exception as exc:  # pragma: no cover - validation edge cases
            session.rollback()
            failure += 1
            failures.append({"question_id": item.question_id, "error": str(exc)})

    job.success_count = success
    job.failure_count = failure
    job.status = "completed"
    job.report = {"failures": failures}
    session.add(job)
    session.commit()
    session.refresh(job)
    return job
