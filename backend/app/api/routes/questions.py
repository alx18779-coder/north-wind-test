"""Administrator question management endpoints."""
from __future__ import annotations

from typing import List

from fastapi import APIRouter, Depends, HTTPException, status
from sqlalchemy.orm import Session

from backend.app.db.session import get_session
from backend.app.models import Question
from backend.app.schemas.question import QuestionCreate, QuestionOut, QuestionUpdate
from backend.app.services import question_service

router = APIRouter(prefix="/admin/questions", tags=["admin-questions"])


@router.get("/", response_model=List[QuestionOut])
def list_questions(session: Session = Depends(get_session)) -> List[Question]:
    return question_service.list_questions(session)


@router.post("/", response_model=QuestionOut, status_code=status.HTTP_201_CREATED)
def create_question(payload: QuestionCreate, session: Session = Depends(get_session)) -> Question:
    return question_service.create_question(session, payload)


@router.get("/export", response_model=list[QuestionOut])
def export_questions(session: Session = Depends(get_session)) -> list[QuestionOut]:
    return question_service.export_questions(session)


@router.post("/import")
def import_questions(payload: list[QuestionCreate], session: Session = Depends(get_session)) -> dict[str, int | list[dict[str, str]]]:
    job = question_service.import_questions(session, payload)
    return {
        "success_count": job.success_count,
        "failure_count": job.failure_count,
        "report": job.report or {},
    }


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
