"""Schemas for learner-facing practice endpoints."""
from __future__ import annotations

from typing import List, Optional

from pydantic import BaseModel, ConfigDict


class PracticeQuestionSummary(BaseModel):
  id: int
  question_id: str
  title: str
  difficulty: str
  category: str
  instance_tags: List[str]

  model_config = ConfigDict(from_attributes=True)


class PracticeQuestionDetail(PracticeQuestionSummary):
  description: str
  required_fields: str
  hints: List[str]
  notes: Optional[str]

  model_config = ConfigDict(from_attributes=True)
