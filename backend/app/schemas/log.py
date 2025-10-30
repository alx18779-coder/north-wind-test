"""Schemas for execution and audit logs."""
from __future__ import annotations

from datetime import datetime
from typing import Optional

from pydantic import BaseModel, ConfigDict, Field


class ExecutionLogQuery(BaseModel):
    question_id: Optional[int] = None
    instance_tag: Optional[str] = None
    status: Optional[str] = None
    from_time: Optional[datetime] = Field(None, alias="from")
    to_time: Optional[datetime] = None
    limit: int = Field(100, ge=1, le=1000)


class ExecutionLogOut(BaseModel):
    id: int
    question_id: Optional[int]
    instance_tag: str
    submitted_sql: str
    sql_hash: str
    status: str
    row_count: Optional[int]
    truncated: bool
    execution_time_ms: Optional[int]
    error_message: Optional[str]
    client_ip: Optional[str]
    user_agent: Optional[str]
    created_at: datetime

    model_config = ConfigDict(from_attributes=True)


class AuditLogQuery(BaseModel):
    admin_user_id: Optional[int] = None
    action: Optional[str] = None
    success: Optional[bool] = None
    from_time: Optional[datetime] = Field(None, alias="from")
    to_time: Optional[datetime] = None
    limit: int = Field(100, ge=1, le=1000)


class AuditLogOut(BaseModel):
    id: int
    admin_user_id: Optional[int]
    action: str
    target_type: Optional[str]
    target_id: Optional[str]
    details: Optional[dict]
    success: bool
    client_ip: Optional[str]
    created_at: datetime

    model_config = ConfigDict(from_attributes=True)
