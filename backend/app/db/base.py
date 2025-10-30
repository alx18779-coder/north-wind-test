"""Declarative base for ORM models."""
from sqlalchemy.orm import DeclarativeBase, declared_attr


class Base(DeclarativeBase):
    """Base class adding naming conventions for tables."""

    @declared_attr.directive
    def __tablename__(cls) -> str:  # type: ignore[override]
        return cls.__name__.lower()


# Import models to ensure metadata registration when Alembic discovers Base
# NOTE: keep import at bottom to avoid circular dependencies during module init.
from backend.app import models  # noqa: E402  # pylint: disable=wrong-import-position
