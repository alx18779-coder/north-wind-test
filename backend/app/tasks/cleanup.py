"""Scheduled cleanup tasks."""
from __future__ import annotations

from sqlalchemy.orm import Session

from backend.app.core.config import settings
from backend.app.db.session import get_session
from backend.app.services import log_service


def cleanup_old_logs(session: Session | None = None) -> None:
    """Clean execution and audit logs older than retention period."""
    should_close = False
    if session is None:
        session_generator = get_session()
        session = next(session_generator)
        should_close = True
    try:
        log_service.cleanup_logs(session, settings.log_retention_days)
    finally:
        if should_close and session is not None:
            session.close()
