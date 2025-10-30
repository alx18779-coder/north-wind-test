from backend.app.core.config import settings


def test_admin_login_success(client, admin_user):  # type: ignore[annotation-unchecked]
    response = client.post("/api/admin/auth/login", json={"username": admin_user.username, "password": "secret"})
    assert response.status_code == 200
    payload = response.json()
    assert payload["token_type"] == "bearer"
    assert isinstance(payload["access_token"], str) and payload["access_token"]
    assert payload["expires_in"] == settings.access_token_expire_minutes * 60


def test_admin_login_failure(client, admin_user):  # type: ignore[annotation-unchecked]
    response = client.post("/api/admin/auth/login", json={"username": admin_user.username, "password": "wrong"})
    assert response.status_code == 401
    assert response.json()["detail"] == "Invalid credentials"


def test_admin_change_password_success(client, admin_user):  # type: ignore[annotation-unchecked]
    response = client.post(
        "/api/admin/auth/change-password",
        json={"username": admin_user.username, "current_password": "secret", "new_password": "new-secret"},
    )
    assert response.status_code == 204

    login_response = client.post(
        "/api/admin/auth/login", json={"username": admin_user.username, "password": "new-secret"}
    )
    assert login_response.status_code == 200


def test_admin_change_password_invalid_current(client, admin_user):  # type: ignore[annotation-unchecked]
    response = client.post(
        "/api/admin/auth/change-password",
        json={"username": admin_user.username, "current_password": "wrong", "new_password": "new-secret"},
    )
    assert response.status_code == 401
    assert response.json()["detail"] == "Invalid credentials"
