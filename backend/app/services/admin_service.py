"""Service helpers for administrator operations."""
from __future__ import annotations

from sqlalchemy import inspect, select
from sqlalchemy.exc import OperationalError, ProgrammingError, SQLAlchemyError
from sqlalchemy.orm import Session

from backend.app.core.security import hash_password
from backend.app.models import AdminUser

DEFAULT_ADMIN_USERNAME = "admin"
DEFAULT_ADMIN_PASSWORD = "admin"


def get_admin_by_username(session: Session, username: str) -> AdminUser | None:
    """Return admin user by username if present."""
    stmt = select(AdminUser).where(AdminUser.username == username)
    return session.execute(stmt).scalar_one_or_none()


def ensure_default_admin(session: Session) -> AdminUser | None:
    """Create default administrator if none exists."""
    bind = session.get_bind()
    if bind is None:
        return None

    try:
        inspector = inspect(bind)
    except SQLAlchemyError:
        return None
    try:
        has_table = inspector.has_table("admin_users")
    except (OperationalError, ProgrammingError):  # database not ready yet
        return None

    if not has_table:
        return None

    user = get_admin_by_username(session, DEFAULT_ADMIN_USERNAME)
    if user is None:
        user = AdminUser(
            username=DEFAULT_ADMIN_USERNAME,
            password_hash=hash_password(DEFAULT_ADMIN_PASSWORD),
            role="admin",
            is_active=True,
        )
        session.add(user)
        session.commit()
        session.refresh(user)
    return user


def update_password(session: Session, user: AdminUser, new_password: str) -> AdminUser:
    """Update the password hash for an administrator."""
    user.password_hash = hash_password(new_password)
    session.add(user)
    session.commit()
    session.refresh(user)
    return user
