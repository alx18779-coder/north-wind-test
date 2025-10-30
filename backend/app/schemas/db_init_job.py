"""Schemas for database initialization jobs."""
from __future__ import annotations

from datetime import datetime
from typing import Optional

from pydantic import BaseModel, ConfigDict


class DbInitJobOut(BaseModel):
    id: int
    instance_id: int
    status: str
    created_at: datetime
    completed_at: Optional[datetime]
    log: Optional[str]

    model_config = ConfigDict(from_attributes=True)
