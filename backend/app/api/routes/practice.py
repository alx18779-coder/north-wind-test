"""Learner-facing practice routes."""
from __future__ import annotations

from typing import Any, Dict, List

from fastapi import APIRouter, Depends, HTTPException, Request, status
from sqlalchemy.orm import Session

from backend.app.db.session import get_session
from backend.app.schemas.practice import PracticeQuestionDetail, PracticeQuestionSummary
from backend.app.services import practice_service

router = APIRouter(prefix="/practice", tags=["practice"])


@router.get("/questions", response_model=List[PracticeQuestionSummary])
def list_questions(session: Session = Depends(get_session)) -> List[PracticeQuestionSummary]:
    return practice_service.list_published_questions(session)


@router.get("/questions/{question_id}", response_model=PracticeQuestionDetail)
def get_question(question_id: int, session: Session = Depends(get_session)) -> PracticeQuestionDetail:
    return practice_service.get_published_question_detail(session, question_id)


class ExecuteRequest(Dict[str, Any]):
    sql: str
    instance_tag: str


@router.post("/questions/{question_id}/execute")
def execute_question(
    question_id: int,
    payload: Dict[str, Any],
    request: Request,
    session: Session = Depends(get_session),
):
    sql = payload.get("sql")
    instance_tag = payload.get("instance_tag")
    if not isinstance(sql, str) or not isinstance(instance_tag, str):
        raise HTTPException(status_code=status.HTTP_400_BAD_REQUEST, detail="sql and instance_tag are required")

    client_ip = request.client.host if request.client else "anonymous"
    result = practice_service.execute_query(session, question_id, sql, instance_tag, client_ip)
    return {"data": result}


@router.get("/history")
def execution_history(request: Request, session: Session = Depends(get_session)):
    client_ip = request.client.host if request.client else "anonymous"
    logs = practice_service.list_execution_history(session, client_ip)
    return [
        {
            "id": log.id,
            "question_id": log.question_id,
            "instance_tag": log.instance_tag,
            "status": log.status,
            "created_at": log.created_at.isoformat() if log.created_at else None,
            "execution_time_ms": log.execution_time_ms,
            "error_message": log.error_message,
        }
        for log in logs
    ]


@router.get("/questions/{question_id}/reference")
def get_reference_answer(
    question_id: int,
    instance_tag: str,
    session: Session = Depends(get_session),
):
    answer = practice_service.get_reference_answer(session, question_id, instance_tag)
    return {"sql": answer}
