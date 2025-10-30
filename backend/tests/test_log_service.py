from datetime import datetime, timedelta, timezone

import pytest

from backend.app.models import AuditLog, ExecutionLog
from backend.app.schemas.log import AuditLogQuery, ExecutionLogQuery
from backend.app.services import log_service


@pytest.mark.usefixtures("db_session", "admin_user")
def test_list_execution_logs_filters(db_session, sample_question):  # type: ignore[annotation-unchecked]
    now = datetime.now(timezone.utc)
    logs = [
        ExecutionLog(
            question_id=sample_question.id,
            instance_tag="pg_default",
            submitted_sql="SELECT 1",
            sql_hash="hash1",
            status="success",
            row_count=1,
            truncated=False,
            execution_time_ms=10,
            created_at=now - timedelta(minutes=1),
        ),
        ExecutionLog(
            question_id=sample_question.id,
            instance_tag="mysql_default",
            submitted_sql="SELECT 2",
            sql_hash="hash2",
            status="timeout",
            row_count=None,
            truncated=False,
            execution_time_ms=None,
            created_at=now,
        ),
    ]
    db_session.add_all(logs)
    db_session.commit()

    result = log_service.list_execution_logs(
        db_session,
        ExecutionLogQuery(
            question_id=sample_question.id,
            instance_tag="pg_default",
            status="success",
            limit=10,
        ),
    )
    assert len(result) == 1
    assert result[0].sql_hash == "hash1"


@pytest.mark.usefixtures("db_session")
def test_list_audit_logs_filters(db_session, admin_user):  # type: ignore[annotation-unchecked]
    now = datetime.now(timezone.utc)
    logs = [
        AuditLog(action="create", admin_user_id=admin_user.id, success=True, created_at=now - timedelta(days=1)),
        AuditLog(action="delete", admin_user_id=admin_user.id, success=False, created_at=now),
    ]
    db_session.add_all(logs)
    db_session.commit()

    result = log_service.list_audit_logs(
        db_session,
        AuditLogQuery(action="delete", success=False, limit=5, admin_user_id=admin_user.id),
    )
    assert len(result) == 1
    assert result[0].action == "delete"


@pytest.mark.usefixtures("db_session")
def test_cleanup_logs(db_session, admin_user):  # type: ignore[annotation-unchecked]
    now = datetime.now(timezone.utc)
    db_session.add_all(
        [
            ExecutionLog(
                question_id=None,
                instance_tag="pg_default",
                submitted_sql="SELECT 1",
                sql_hash="old",
                status="success",
                row_count=1,
                truncated=False,
                execution_time_ms=10,
                created_at=now - timedelta(days=10),
            ),
            ExecutionLog(
                question_id=None,
                instance_tag="pg_default",
                submitted_sql="SELECT 1",
                sql_hash="new",
                status="success",
                row_count=1,
                truncated=False,
                execution_time_ms=10,
                created_at=now,
            ),
            AuditLog(
                action="create",
                admin_user_id=admin_user.id,
                success=True,
                created_at=now - timedelta(days=10),
            ),
            AuditLog(
                action="create",
                admin_user_id=admin_user.id,
                success=True,
                created_at=now,
            ),
        ]
    )
    db_session.commit()

    log_service.cleanup_logs(db_session, retention_days=7)

    exec_logs = log_service.list_execution_logs(db_session, ExecutionLogQuery(limit=10))
    audit_logs = log_service.list_audit_logs(db_session, AuditLogQuery(limit=10, admin_user_id=admin_user.id))

    assert all(log.sql_hash != "old" for log in exec_logs)
    assert all(log.created_at >= now - timedelta(days=7) for log in audit_logs)


@pytest.mark.usefixtures("db_session")
def test_record_audit_log(db_session, admin_user):  # type: ignore[annotation-unchecked]
    log = log_service.record_audit_log(
        db_session,
        action="test",
        target_type="sample",
        target_id="1",
        success=True,
        details={"info": "sample"},
        admin_user_id=admin_user.id,
        client_ip="127.0.0.1",
    )
    assert log.id is not None
    logs = log_service.list_audit_logs(db_session, AuditLogQuery(limit=10))
    assert any(entry.id == log.id for entry in logs)
