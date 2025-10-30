"""Schemas for question management."""
from __future__ import annotations

from typing import Iterable, List, Optional

from pydantic import BaseModel, ConfigDict, Field, field_validator, model_validator


def _normalize_instance_tags(value: Optional[Iterable[str] | str]) -> List[str]:
    if value is None:
        return []
    items: Iterable[str]
    if isinstance(value, str):
        items = [value]
    else:
        items = value
    cleaned: List[str] = []
    seen: set[str] = set()
    for item in items:
        if not isinstance(item, str):
            raise ValueError("instance_tags 必须是字符串列表")
        stripped = item.strip()
        if stripped and stripped not in seen:
            seen.add(stripped)
            cleaned.append(stripped)
    return cleaned


class QuestionReferencePayload(BaseModel):
    engine: str = Field(..., pattern=r"^(postgres|mysql)$")
    sql_text: str = Field(..., min_length=1)


class QuestionHintPayload(BaseModel):
    display_order: int = Field(..., ge=1)
    content: str = Field(..., min_length=1)


class QuestionBase(BaseModel):
    question_id: str = Field(..., max_length=50)
    title: str = Field(..., max_length=200)
    description: str
    required_fields: str
    difficulty: str = Field(..., max_length=50)
    category: str = Field(..., max_length=100)
    status: str = Field("draft", max_length=50)
    instance_tags: List[str] = Field(default_factory=list)
    notes: Optional[str] = None

    @field_validator("instance_tags", mode="before")
    @classmethod
    def _normalize_tags(cls, value: Optional[Iterable[str] | str]) -> List[str]:
        return _normalize_instance_tags(value)


class QuestionCreate(QuestionBase):
    reference_sql: List[QuestionReferencePayload]
    hints: List[QuestionHintPayload] = Field(default_factory=list)

    @model_validator(mode="after")
    def _ensure_tags(self) -> "QuestionCreate":
        if not self.instance_tags:
            raise ValueError("instance_tags 至少需要包含一个有效标签")
        return self


class QuestionUpdate(BaseModel):
    title: Optional[str] = Field(None, max_length=200)
    description: Optional[str] = None
    required_fields: Optional[str] = None
    difficulty: Optional[str] = Field(None, max_length=50)
    category: Optional[str] = Field(None, max_length=100)
    status: Optional[str] = Field(None, max_length=50)
    instance_tags: Optional[List[str]] = None
    notes: Optional[str] = None
    reference_sql: Optional[List[QuestionReferencePayload]] = None
    hints: Optional[List[QuestionHintPayload]] = None

    @field_validator("instance_tags", mode="before")
    @classmethod
    def _normalize_tags(cls, value: Optional[Iterable[str] | str]) -> Optional[List[str]]:
        if value is None:
            return None
        cleaned = _normalize_instance_tags(value)
        if not cleaned:
            raise ValueError("instance_tags 至少需要包含一个有效标签")
        return cleaned


class QuestionReferenceOut(QuestionReferencePayload):
    id: int

    model_config = ConfigDict(from_attributes=True)


class QuestionHintOut(QuestionHintPayload):
    id: int

    model_config = ConfigDict(from_attributes=True)


class QuestionOut(QuestionBase):
    id: int
    reference_sql: List[QuestionReferenceOut]
    hints: List[QuestionHintOut]

    model_config = ConfigDict(from_attributes=True)
