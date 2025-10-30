"""SQL validation helpers ensuring safe read-only queries."""
from __future__ import annotations

import sqlparse
from sqlparse import sql as sql_ast

FORBIDDEN_KEYWORDS = {
    "insert",
    "update",
    "delete",
    "drop",
    "alter",
    "truncate",
    "merge",
    "create",
    "replace",
    "grant",
    "revoke",
    "execute",
    "call",
    "attach",
}


def _strip_trailing_semicolon(sql: str) -> str:
    stripped = sql.strip()
    while stripped.endswith(";"):
        stripped = stripped[:-1].rstrip()
    return stripped


def validate_read_only_sql(sql: str) -> None:
    if not sql or not sql.strip():
        raise ValueError("SQL cannot be empty")

    stripped = _strip_trailing_semicolon(sql)
    statements = [statement for statement in sqlparse.split(stripped) if statement.strip()]
    if len(statements) != 1:
        raise ValueError("Only single statements are allowed")

    statement_sql = statements[0].strip()
    parsed = sqlparse.parse(statement_sql)
    if len(parsed) != 1:
        raise ValueError("Only single statements are allowed")

    statement = parsed[0]
    non_comment_tokens = [token for token in statement.tokens if not token.is_whitespace and not isinstance(token, sql_ast.Comment)]
    first_token = non_comment_tokens[0] if non_comment_tokens else None
    if first_token is None:
        raise ValueError("SQL statement is invalid")

    token_value = first_token.value.upper()
    if not (token_value.startswith("SELECT") or token_value.startswith("WITH")):
        raise ValueError("Only SELECT statements (optionally with CTEs) are allowed")

    sanitized_sql = "".join(token.value for token in statement.tokens if not isinstance(token, sql_ast.Comment))
    lowered = sanitized_sql.lower()
    for keyword in FORBIDDEN_KEYWORDS:
        if keyword in lowered:
            raise ValueError(f"Forbidden keyword detected: {keyword}")
