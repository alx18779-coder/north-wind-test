import pytest

from backend.app.services.sql_validation import validate_read_only_sql


@pytest.mark.parametrize(
    "sql",
    [
        "SELECT * FROM customers",
        "with cte as (select 1) select * from cte",
    ],
)
def test_validate_read_only_valid(sql):
    validate_read_only_sql(sql)


@pytest.mark.parametrize(
    "sql",
    [
        "",
        "DROP TABLE customers",
        "SELECT * FROM customers; DELETE FROM orders",
        "UPDATE customers SET name='x'",
    ],
)
def test_validate_read_only_invalid(sql):
    with pytest.raises(ValueError):
        validate_read_only_sql(sql)
