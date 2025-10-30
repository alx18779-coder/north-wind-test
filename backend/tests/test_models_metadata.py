from backend.app.db.base import Base


def test_metadata_contains_core_tables() -> None:
    table_names = {table.name for table in Base.metadata.sorted_tables}
    expected_tables = {
        "admin_users",
        "database_instances",
        "app_settings",
        "questions",
        "question_reference_sql",
        "question_hints",
        "question_import_jobs",
        "execution_logs",
        "audit_logs",
        "db_init_jobs",
    }
    assert expected_tables.issubset(table_names)
