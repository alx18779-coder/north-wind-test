"""Schemas for database instance management."""
from __future__ import annotations

from typing import List, Optional

from pydantic import BaseModel, Field


class DatabaseInstanceBase(BaseModel):
    name: str = Field(..., max_length=150)
    engine: str = Field(..., pattern=r"^(postgres|mysql)$")
    host: str
    port: int = Field(..., ge=1, le=65535)
    database: str
    username: str
    password: str
    timeout_seconds: int = Field(6, ge=1, le=60)
    max_rows: int = Field(1000, ge=1)
    max_concurrency: int = Field(5, ge=1)
    rate_limit_per_minute: int = Field(30, ge=1)
    tags: List[str] = Field(default_factory=list)
    notes: Optional[str] = None


class DatabaseInstanceCreate(DatabaseInstanceBase):
    pass


class DatabaseInstanceUpdate(BaseModel):
    name: Optional[str] = Field(None, max_length=150)
    host: Optional[str] = None
    port: Optional[int] = Field(None, ge=1, le=65535)
    database: Optional[str] = None
    username: Optional[str] = None
    password: Optional[str] = None
    timeout_seconds: Optional[int] = Field(None, ge=1, le=60)
    max_rows: Optional[int] = Field(None, ge=1)
    max_concurrency: Optional[int] = Field(None, ge=1)
    rate_limit_per_minute: Optional[int] = Field(None, ge=1)
    tags: Optional[List[str]] = None
    notes: Optional[str] = None
    status: Optional[str] = Field(None, max_length=50)


from pydantic import ConfigDict


class DatabaseInstanceOut(BaseModel):
    id: int
    name: str
    engine: str
    host: str
    port: int
    database: str
    username: str
    timeout_seconds: int
    max_rows: int
    max_concurrency: int
    rate_limit_per_minute: int
    tags: List[str]
    status: str
    notes: Optional[str]

    model_config = ConfigDict(from_attributes=True)
