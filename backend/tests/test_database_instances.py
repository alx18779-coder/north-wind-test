import pytest
from sqlalchemy import text
from sqlalchemy.engine import make_url

from backend.app.core.config import settings
from backend.app.services.database_instance_service import list_instances


@pytest.mark.usefixtures("client")
def test_create_and_get_database_instance(client, db_session, tmp_path):  # type: ignore[annotation-unchecked]
    url = make_url(settings.database_url)
    payload = {
        "name": "pg-primary",
        "engine": "postgres",
        "host": url.host or "localhost",
        "port": url.port or 5432,
        "database": url.database or "postgres",
        "username": url.username or "postgres",
        "password": url.password or "",
        "timeout_seconds": 6,
        "max_rows": 1000,
        "max_concurrency": 5,
        "rate_limit_per_minute": 30,
        "tags": ["pg_default"],
    }

    script_path = tmp_path / "init.sql"
    script_path.write_text(
        """
        CREATE TABLE IF NOT EXISTS init_job_check(id SERIAL PRIMARY KEY);
        INSERT INTO init_job_check DEFAULT VALUES;
        """.strip()
    )
    original_script_path = settings.northwind_pg_script_path
    settings.northwind_pg_script_path = str(script_path)

    try:
        response = client.post("/api/admin/db-instances/", json=payload)
        assert response.status_code == 201
        data = response.json()
        assert data["name"] == payload["name"]
        assert data["engine"] == "postgres"
        instance_id = data["id"]

        response = client.get(f"/api/admin/db-instances/{instance_id}")
        assert response.status_code == 200
        assert response.json()["name"] == payload["name"]

        response = client.patch(
            f"/api/admin/db-instances/{instance_id}", json={"timeout_seconds": 10, "notes": "updated"}
        )
        assert response.status_code == 200
        assert response.json()["timeout_seconds"] == 10

        response = client.post(f"/api/admin/db-instances/{instance_id}/test")
        assert response.status_code == 200
        assert response.json()["status"] == "ok"

        response = client.post(f"/api/admin/db-instances/{instance_id}/init")
        assert response.status_code == 201
        job = response.json()
        assert job["instance_id"] == instance_id
        assert job["status"] == "completed"

        response = client.post(f"/api/admin/db-instances/{instance_id}/decrypt-password")
        assert response.status_code == 200
        assert response.json() == payload["password"]

        instances = list_instances(db_session)
        assert len(instances) == 1
    finally:
        db_session.execute(text("DROP TABLE IF EXISTS init_job_check"))
        db_session.commit()
        settings.northwind_pg_script_path = original_script_path

    response = client.delete(f"/api/admin/db-instances/{instance_id}")
    assert response.status_code == 204
    response = client.get(f"/api/admin/db-instances/{instance_id}")
    assert response.status_code == 404
