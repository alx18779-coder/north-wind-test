"""Service layer for database instance management."""
from __future__ import annotations

from typing import List

from sqlalchemy import select, text as sa_text
from sqlalchemy.dialects import postgresql
from sqlalchemy.engine import Engine, URL, create_engine
from sqlalchemy.orm import Session

from backend.app.core import crypto
from backend.app.models import DatabaseInstance
from backend.app.schemas.database_instance import DatabaseInstanceCreate, DatabaseInstanceUpdate
from backend.app.services.log_service import record_audit_log


def list_instances(session: Session) -> List[DatabaseInstance]:
    stmt = select(DatabaseInstance).order_by(DatabaseInstance.id)
    return list(session.scalars(stmt))


def get_instance(session: Session, instance_id: int) -> DatabaseInstance | None:
    return session.get(DatabaseInstance, instance_id)


def create_instance(session: Session, payload: DatabaseInstanceCreate) -> DatabaseInstance:
    instance = DatabaseInstance(
        name=payload.name,
        engine=payload.engine,
        host=payload.host,
        port=payload.port,
        database=payload.database,
        username=payload.username,
        password_encrypted=crypto.encrypt(payload.password),
        timeout_seconds=payload.timeout_seconds,
        max_rows=payload.max_rows,
        max_concurrency=payload.max_concurrency,
        rate_limit_per_minute=payload.rate_limit_per_minute,
        tags=payload.tags,
        notes=payload.notes,
    )
    session.add(instance)
    session.commit()
    session.refresh(instance)
    return instance


def update_instance(session: Session, instance: DatabaseInstance, payload: DatabaseInstanceUpdate) -> DatabaseInstance:
    for field, value in payload.dict(exclude_unset=True).items():
        if field == "password" and value is not None:
            instance.password_encrypted = crypto.encrypt(value)
        elif hasattr(instance, field):
            setattr(instance, field, value)
    session.add(instance)
    session.commit()
    session.refresh(instance)
    return instance


def delete_instance(session: Session, instance: DatabaseInstance) -> None:
    session.delete(instance)
    session.commit()


def build_connection_url(instance: DatabaseInstance, password: str) -> str:
    """Build a SQLAlchemy URL with proper escaping for special characters.

    Avoid manual string interpolation to prevent DSN breakage when username/password
    contain special characters like @/:#?.
    """
    if instance.engine == "postgres":
        driver = "postgresql+psycopg"
    elif instance.engine == "mysql":
        driver = "mysql+pymysql"
    else:  # pragma: no cover - guarded by schema validation
        raise ValueError(f"Unsupported engine: {instance.engine}")

    url = URL.create(
        drivername=driver,
        username=instance.username,
        password=password,
        host=instance.host,
        port=instance.port,
        database=instance.database,
    )
    return str(url)


def create_execution_engine(url: str, timeout_seconds: int) -> Engine:
    if url.startswith("postgresql"):
        options = f"-c statement_timeout={timeout_seconds * 1000}"
        if "options=" not in url:
            if "?" in url:
                url = f"{url}&options={options}"
            else:
                url = f"{url}?options={options}"
    return create_engine(url, pool_pre_ping=True, future=True)


def get_instance_by_tag(session: Session, tag: str) -> DatabaseInstance | None:
    dialect_name = session.bind.dialect.name if session.bind is not None else None
    if dialect_name == "postgresql":
        stmt = select(DatabaseInstance).where(DatabaseInstance.tags.cast(postgresql.JSONB).contains([tag]))
    else:
        stmt = select(DatabaseInstance).where(DatabaseInstance.tags.contains([tag]))
    return session.execute(stmt).scalars().first()


def test_connection(session: Session, instance: DatabaseInstance) -> bool:
    password = crypto.decrypt(instance.password_encrypted)
    dsn = build_connection_url(instance, password)
    engine = create_engine(dsn, pool_pre_ping=True, future=True)
    try:
        with engine.connect() as conn:
            conn.execute(sa_text("SELECT 1"))
        record_audit_log(
            session,
            action="db_instance_test",
            target_type="database_instance",
            target_id=str(instance.id),
            success=True,
        )
        return True
    except Exception as exc:  # pragma: no cover - network specific
        record_audit_log(
            session,
            action="db_instance_test",
            target_type="database_instance",
            target_id=str(instance.id),
            success=False,
            details={"error": str(exc)},
        )
        return False
    finally:
        engine.dispose()
