"""Bootstrap default practice questions from CSV on startup.

The importer is idempotent: it inserts rows when question_id does not exist.
CSV files are expected at docs/questions_pg.csv and docs/questions_mysql.csv.
"""
from __future__ import annotations

import csv
import os
from typing import Iterable

from sqlalchemy.orm import Session

from backend.app.models import Question
from backend.app.schemas.question import (
    QuestionCreate,
    QuestionHintPayload,
    QuestionReferencePayload,
)
from backend.app.services import question_service


def _load_csv(path: str) -> list[dict[str, str]]:
    if not os.path.exists(path):
        return []
    with open(path, encoding="utf-8") as f:
        return list(csv.DictReader(f))


def _row_to_payload(row: dict[str, str]) -> QuestionCreate:
    refs: list[QuestionReferencePayload] = []
    pg_sql = (row.get("reference_sql_pg") or "").strip()
    if pg_sql:
        refs.append(QuestionReferencePayload(engine="postgres", sql_text=pg_sql))
    my_sql = (row.get("reference_sql_mysql") or "").strip()
    if my_sql:
        refs.append(QuestionReferencePayload(engine="mysql", sql_text=my_sql))

    hints: list[QuestionHintPayload] = []
    raw_hints = (row.get("hints") or "").strip()
    if raw_hints:
        parts: Iterable[str] = (p.strip() for p in raw_hints.split(";") if p.strip())
        for i, part in enumerate(parts, start=1):
            hints.append(QuestionHintPayload(display_order=i, content=part))

    tags = [t.strip() for t in (row.get("instance_tags") or "").split(",") if t.strip()]

    return QuestionCreate(
        question_id=row["question_id"],
        title=row["title"],
        description=row["description"],
        required_fields=row["required_fields"],
        difficulty=row["difficulty"],
        category=row["category"],
        status=(row.get("status") or "published"),
        instance_tags=tags,
        notes=None,
        reference_sql=refs,
        hints=hints,
    )


def ensure_default_questions(session: Session) -> dict[str, int]:
    """Import default questions from CSV when table is empty.

    Returns a summary dict with counts for visibility in logs.
    """
    existing = session.query(Question).count()
    if existing > 0:
        return {"skipped": existing, "imported": 0}

    base = "/app"
    paths = [
        os.path.join(base, "docs", "questions_pg.csv"),
        os.path.join(base, "docs", "questions_mysql.csv"),
    ]

    created = 0
    for path in paths:
        for row in _load_csv(path):
            if session.query(Question).filter_by(question_id=row.get("question_id")).first():
                continue
            payload = _row_to_payload(row)
            question_service.create_question(session, payload)
            created += 1

    return {"skipped": existing, "imported": created}

