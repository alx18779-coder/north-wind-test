"""Schemas for import/export operations."""
from __future__ import annotations

from pydantic import BaseModel, Field


class ImportReport(BaseModel):
    failures: list[dict[str, str]] = Field(default_factory=list)


class QuestionsImportResponse(BaseModel):
    success_count: int
    failure_count: int
    report: ImportReport

