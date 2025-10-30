"""Database engine and session management."""
from collections.abc import Iterator

from sqlalchemy import create_engine
from sqlalchemy.orm import Session, sessionmaker

from backend.app.core.config import settings

# Using synchronous engine for now; can switch to async when needed.
_engine = create_engine(settings.database_url, echo=settings.debug, future=True)
SessionLocal = sessionmaker(bind=_engine, autoflush=False, autocommit=False)


def get_session() -> Iterator[Session]:
    """Provide a SQLAlchemy session for request-scoped usage."""
    session = SessionLocal()
    try:
        yield session
    finally:
        session.close()
