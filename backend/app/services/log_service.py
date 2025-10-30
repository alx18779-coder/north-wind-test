"""Services for execution and audit logs."""
from __future__ import annotations

from datetime import datetime, timedelta, timezone
from typing import List

from sqlalchemy import Select, delete, select
from sqlalchemy.orm import Session

from backend.app.models import AuditLog, ExecutionLog
from backend.app.schemas.log import AuditLogQuery, ExecutionLogQuery


def _apply_time_range(stmt: Select, from_time: datetime | None, to_time: datetime | None, column) -> Select:
    if from_time is not None:
        stmt = stmt.where(column >= from_time)
    if to_time is not None:
        stmt = stmt.where(column <= to_time)
    return stmt


def list_execution_logs(session: Session, params: ExecutionLogQuery) -> List[ExecutionLog]:
    stmt = select(ExecutionLog).order_by(ExecutionLog.created_at.desc())
    if params.question_id is not None:
        stmt = stmt.where(ExecutionLog.question_id == params.question_id)
    if params.instance_tag is not None:
        stmt = stmt.where(ExecutionLog.instance_tag == params.instance_tag)
    if params.status is not None:
        stmt = stmt.where(ExecutionLog.status == params.status)
    stmt = _apply_time_range(stmt, params.from_time, params.to_time, ExecutionLog.created_at)
    stmt = stmt.limit(params.limit)
    return list(session.scalars(stmt))


def list_audit_logs(session: Session, params: AuditLogQuery) -> List[AuditLog]:
    stmt = select(AuditLog).order_by(AuditLog.created_at.desc())
    if params.admin_user_id is not None:
        stmt = stmt.where(AuditLog.admin_user_id == params.admin_user_id)
    if params.action is not None:
        stmt = stmt.where(AuditLog.action == params.action)
    if params.success is not None:
        stmt = stmt.where(AuditLog.success == params.success)
    stmt = _apply_time_range(stmt, params.from_time, params.to_time, AuditLog.created_at)
    stmt = stmt.limit(params.limit)
    return list(session.scalars(stmt))


def cleanup_logs(session: Session, retention_days: int) -> None:
    cutoff = datetime.now(timezone.utc) - timedelta(days=retention_days)
    session.execute(delete(ExecutionLog).where(ExecutionLog.created_at < cutoff))
    session.execute(delete(AuditLog).where(AuditLog.created_at < cutoff))
    session.commit()


def record_audit_log(
    session: Session,
    action: str,
    target_type: str | None,
    target_id: str | None,
    success: bool,
    details: dict | None = None,
    admin_user_id: int | None = None,
    client_ip: str | None = None,
) -> AuditLog:
    log_entry = AuditLog(
        action=action,
        target_type=target_type,
        target_id=target_id,
        success=success,
        details=details,
        admin_user_id=admin_user_id,
        client_ip=client_ip,
    )
    session.add(log_entry)
    session.commit()
    session.refresh(log_entry)
    return log_entry
