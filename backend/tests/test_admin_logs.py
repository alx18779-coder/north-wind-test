import pytest

from backend.app.models import AuditLog, ExecutionLog


@pytest.mark.usefixtures("client", "admin_user")
def test_execution_logs_endpoint(client, db_session, sample_question):  # type: ignore[annotation-unchecked]
    db_session.add(
        ExecutionLog(
            question_id=sample_question.id,
            instance_tag="pg_default",
            submitted_sql="SELECT 1",
            sql_hash="hash-1",
            status="success",
            row_count=1,
            truncated=False,
            execution_time_ms=12,
        )
    )
    db_session.commit()

    response = client.get("/api/admin/logs/execution")
    assert response.status_code == 200
    data = response.json()
    assert len(data) == 1
    assert data[0]["sql_hash"] == "hash-1"


@pytest.mark.usefixtures("client")
def test_audit_logs_endpoint(client, db_session, admin_user):  # type: ignore[annotation-unchecked]
    db_session.add(AuditLog(action="create", admin_user_id=admin_user.id, success=True))
    db_session.commit()

    response = client.get("/api/admin/logs/audit")
    assert response.status_code == 200
    data = response.json()
    assert len(data) == 1
    assert data[0]["action"] == "create"
