"""Admin log listing and export routes."""
from __future__ import annotations

from typing import List

from fastapi import APIRouter, Depends, Query
from sqlalchemy.orm import Session

from backend.app.db.session import get_session
from backend.app.schemas.log import AuditLogOut, AuditLogQuery, ExecutionLogOut, ExecutionLogQuery
from backend.app.services import log_service

router = APIRouter(prefix="/admin/logs", tags=["admin-logs"])


@router.get("/execution", response_model=List[ExecutionLogOut])
def list_execution_logs(
    question_id: int | None = Query(None),
    instance_tag: str | None = Query(None),
    status: str | None = Query(None),
    from_time: str | None = Query(None, alias="from"),
    to_time: str | None = Query(None),
    limit: int = Query(100, ge=1, le=1000),
    session: Session = Depends(get_session),
):
    params = ExecutionLogQuery(
        question_id=question_id,
        instance_tag=instance_tag,
        status=status,
        from_time=from_time,
        to_time=to_time,
        limit=limit,
    )
    return log_service.list_execution_logs(session, params)


@router.get("/audit", response_model=List[AuditLogOut])
def list_audit_logs(
    admin_user_id: int | None = Query(None),
    action: str | None = Query(None),
    success: bool | None = Query(None),
    from_time: str | None = Query(None, alias="from"),
    to_time: str | None = Query(None),
    limit: int = Query(100, ge=1, le=1000),
    session: Session = Depends(get_session),
):
    params = AuditLogQuery(
        admin_user_id=admin_user_id,
        action=action,
        success=success,
        from_time=from_time,
        to_time=to_time,
        limit=limit,
    )
    return log_service.list_audit_logs(session, params)


@router.get("/execution/export", response_model=List[ExecutionLogOut])
def export_execution_logs(
    session: Session = Depends(get_session),
    limit: int = Query(1000, ge=1, le=5000),
):
    params = ExecutionLogQuery(limit=limit)
    return log_service.list_execution_logs(session, params)


@router.get("/audit/export", response_model=List[AuditLogOut])
def export_audit_logs(session: Session = Depends(get_session), limit: int = Query(1000, ge=1, le=5000)):
    params = AuditLogQuery(limit=limit)
    return log_service.list_audit_logs(session, params)
