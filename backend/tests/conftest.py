from collections.abc import Generator

import pytest
from fastapi.testclient import TestClient
from sqlalchemy import create_engine, text as sa_text
from sqlalchemy.exc import OperationalError
from sqlalchemy.orm import Session, sessionmaker

from backend.app.core.config import settings
from backend.app.core.security import hash_password
from backend.app.db.base import Base
from backend.app.db.session import get_session
from backend.app.main import app
from backend.app.models import AdminUser, Question


@pytest.fixture(scope="session")
def engine() -> Generator:
    engine = create_engine(settings.database_url)
    try:
        with engine.connect() as connection:
            connection.execute(sa_text("SELECT 1"))
    except OperationalError as exc:  # pragma: no cover - environment dependent
        pytest.skip(f"PostgreSQL not reachable: {exc}")

    Base.metadata.drop_all(bind=engine)
    Base.metadata.create_all(bind=engine)
    try:
        yield engine
    finally:
        Base.metadata.drop_all(bind=engine)
        engine.dispose()


@pytest.fixture()
def db_session(engine) -> Generator[Session, None, None]:
    connection = engine.connect()
    transaction = connection.begin()
    SessionLocal = sessionmaker(bind=connection, autocommit=False, autoflush=False, expire_on_commit=False)
    session = SessionLocal()
    try:
        yield session
    finally:
        session.close()
        transaction.rollback()
        connection.close()


@pytest.fixture()
def admin_user(db_session: Session) -> AdminUser:
    user = db_session.query(AdminUser).filter(AdminUser.username == "admin").one_or_none()
    if user is None:
        user = AdminUser(username="admin", password_hash=hash_password("secret"), role="admin")
        db_session.add(user)
    else:
        user.password_hash = hash_password("secret")
        db_session.add(user)
    db_session.commit()
    db_session.refresh(user)
    return user


@pytest.fixture()
def client(db_session: Session) -> Generator[TestClient, None, None]:
    def override_get_session() -> Generator[Session, None, None]:
        yield db_session

    app.dependency_overrides[get_session] = override_get_session
    with TestClient(app) as test_client:
        yield test_client
    app.dependency_overrides.clear()


@pytest.fixture()
def sample_question(db_session: Session) -> Question:
    question = Question(
        question_id="QTEST",
        title="Sample",
        description="Sample question",
        required_fields="id",
        difficulty="beginner",
        category="general",
        status="draft",
        instance_tags=["pg_default"],
    )
    db_session.add(question)
    db_session.commit()
    db_session.refresh(question)
    return question
