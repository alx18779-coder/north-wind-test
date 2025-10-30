import pytest


@pytest.mark.usefixtures("client")
def test_question_crud(client):  # type: ignore[annotation-unchecked]
    payload = {
        "question_id": "Q100",
        "title": "示例题目",
        "description": "列出所有顾客",
        "required_fields": "CustomerID, CompanyName",
        "difficulty": "beginner",
        "category": "select",
        "status": "draft",
        "instance_tags": ["pg_default"],
        "reference_sql": [
            {"engine": "postgres", "sql_text": "SELECT * FROM customers"}
        ],
        "hints": [
            {"display_order": 1, "content": "使用 SELECT"}
        ],
    }

    # Create
    response = client.post("/api/admin/questions/", json=payload)
    assert response.status_code == 201
    data = response.json()
    assert data["question_id"] == "Q100"
    question_id = data["id"]
    assert len(data["reference_sql"]) == 1
    assert len(data["hints"]) == 1

    # List
    response = client.get("/api/admin/questions/")
    assert response.status_code == 200
    assert any(item["id"] == question_id for item in response.json())

    # Update (replace reference sql and hints)
    update_payload = {
        "title": "示例题目-更新",
        "reference_sql": [
            {"engine": "postgres", "sql_text": "SELECT customer_id FROM customers"}
        ],
        "hints": [
            {"display_order": 1, "content": "使用 SELECT"},
            {"display_order": 2, "content": "筛选列"},
        ],
    }
    response = client.patch(f"/api/admin/questions/{question_id}", json=update_payload)
    assert response.status_code == 200
    data = response.json()
    assert data["title"] == "示例题目-更新"
    assert len(data["reference_sql"]) == 1
    assert data["reference_sql"][0]["sql_text"] == "SELECT customer_id FROM customers"
    assert len(data["hints"]) == 2

    # Delete
    response = client.delete(f"/api/admin/questions/{question_id}")
    assert response.status_code == 204

    response = client.get(f"/api/admin/questions/{question_id}")
    assert response.status_code == 404
