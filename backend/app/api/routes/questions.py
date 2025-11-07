"""Administrator question management endpoints."""
from __future__ import annotations

from typing import List

from fastapi import APIRouter, Depends, HTTPException, status
from sqlalchemy.orm import Session

from backend.app.db.session import get_session
from backend.app.models import Question
from backend.app.schemas.question import QuestionCreate, QuestionOut, QuestionUpdate
from backend.app.schemas.imports import (
    QuestionsImportResponse,
    ImportReport,
    QuestionsImportValidateResponse,
    ValidationErrorItem,
    ImportValidateStats,
)
from backend.app.services import database_instance_service
from backend.app.services import question_service

router = APIRouter(prefix="/admin/questions", tags=["admin-questions"])


@router.get("/", response_model=List[QuestionOut])
def list_questions(session: Session = Depends(get_session)) -> List[Question]:
    return question_service.list_questions(session)

# 兼容无尾斜杠 GET /admin/questions
@router.get("", response_model=List[QuestionOut])
def list_questions_no_slash(session: Session = Depends(get_session)) -> List[Question]:
    return question_service.list_questions(session)


@router.post("/", response_model=QuestionOut, status_code=status.HTTP_201_CREATED)
def create_question(payload: QuestionCreate, session: Session = Depends(get_session)) -> Question:
    return question_service.create_question(session, payload)

# 兼容无尾斜杠 POST /admin/questions
@router.post("", response_model=QuestionOut, status_code=status.HTTP_201_CREATED)
def create_question_no_slash(payload: QuestionCreate, session: Session = Depends(get_session)) -> Question:
    return question_service.create_question(session, payload)


@router.get("/export", response_model=list[QuestionOut])
def export_questions(session: Session = Depends(get_session)) -> list[QuestionOut]:
    return question_service.export_questions(session)


@router.post("/import", response_model=QuestionsImportResponse)
def import_questions(payload: list[QuestionCreate], session: Session = Depends(get_session)) -> QuestionsImportResponse:
    job = question_service.import_questions(session, payload)
    report = ImportReport.model_validate(job.report or {})
    return QuestionsImportResponse(
        success_count=job.success_count,
        failure_count=job.failure_count,
        report=report,
    )


@router.post("/import/validate", response_model=QuestionsImportValidateResponse)
def validate_import(payload: list[QuestionCreate], session: Session = Depends(get_session)) -> QuestionsImportValidateResponse:
    # collect existing tags and engines per tag
    instances = database_instance_service.list_instances(session)
    existing_tags: set[str] = set()
    tag_engine: dict[str, str] = {}
    for inst in instances:
        for t in (inst.tags or []):
            existing_tags.add(t)
            tag_engine[t] = inst.engine

    allowed_difficulty = {"beginner", "intermediate", "advanced"}
    allowed_status = {"draft", "published"}

    errors: list[ValidationErrorItem] = []
    valid_count = 0

    for idx, item in enumerate(payload):
        row_errors: list[ValidationErrorItem] = []
        def add(field: str, msg: str) -> None:
            row_errors.append(ValidationErrorItem(index=idx, field=field, message=msg))

        # basic required checks (Pydantic already guards many; double-check enums here)
        if item.difficulty not in allowed_difficulty:
            add("difficulty", f"不支持的难度: {item.difficulty}")
        if item.status not in allowed_status:
            add("status", f"不支持的状态: {item.status}")

        # question_id uniqueness
        if item.question_id:
            exists = (
                session.query(Question)
                .filter(Question.question_id == item.question_id)
                .first()
                is not None
            )
            if exists:
                add("question_id", f"题号已存在: {item.question_id}")

        # instance tag existence
        missing = [t for t in item.instance_tags if t not in existing_tags]
        if missing:
            add("instance_tags", f"以下标签在系统中不存在: {', '.join(missing)}")

        # reference sql presence and engine coverage
        if not item.reference_sql:
            add("reference_sql", "必须至少提供一条参考 SQL")
        else:
            engines = {ref.engine for ref in item.reference_sql}
            invalid_eng = [ref.engine for ref in item.reference_sql if ref.engine not in {"postgres", "mysql"}]
            if invalid_eng:
                add("reference_sql.engine", f"不支持的引擎: {', '.join(sorted(set(invalid_eng)))}")
            # for tags that exist, require at least one matching engine
            mapped_engines = {tag_engine[t] for t in item.instance_tags if t in tag_engine}
            if mapped_engines and not (engines & mapped_engines):
                add("reference_sql", f"参考 SQL 未覆盖实例引擎: 需要 {', '.join(sorted(mapped_engines))}")

            # Static read-only check: forbid DML/DDL keywords
            forbidden = ("insert", "update", "delete", "create", "alter", "drop", "truncate", "grant", "revoke")
            for ref in item.reference_sql:
                sql_lc = (ref.sql_text or "").lower()
                # naive comment strip: remove leading '--' lines
                stripped = "\n".join(
                    line for line in sql_lc.splitlines() if not line.strip().startswith("--")
                )
                if any(f" {kw} " in f" {stripped} " for kw in forbidden):
                    add("reference_sql", "参考 SQL 需为只读查询，禁止包含 DML/DDL 关键字")

        if row_errors:
            errors.extend(row_errors)
        else:
            valid_count += 1

    stats = ImportValidateStats(rows=len(payload), valid=valid_count, invalid=len(payload) - valid_count)
    return QuestionsImportValidateResponse(ok=len(errors) == 0, errors=errors, stats=stats)


@router.get("/{question_id}", response_model=QuestionOut)
def get_question(question_id: int, session: Session = Depends(get_session)) -> Question:
    question = question_service.get_question(session, question_id)
    if question is None:
        raise HTTPException(status_code=status.HTTP_404_NOT_FOUND, detail="Question not found")
    return question


@router.patch("/{question_id}", response_model=QuestionOut)
def update_question(question_id: int, payload: QuestionUpdate, session: Session = Depends(get_session)) -> Question:
    question = question_service.get_question(session, question_id)
    if question is None:
        raise HTTPException(status_code=status.HTTP_404_NOT_FOUND, detail="Question not found")
    return question_service.update_question(session, question, payload)


@router.delete("/{question_id}", status_code=status.HTTP_204_NO_CONTENT)
def delete_question(question_id: int, session: Session = Depends(get_session)) -> None:
    question = question_service.get_question(session, question_id)
    if question is None:
        raise HTTPException(status_code=status.HTTP_404_NOT_FOUND, detail="Question not found")
    question_service.delete_question(session, question)
