# API Draft

All endpoints return JSON with the shape:
```
{
  "data": <payload or null>,
  "meta": { ... optional pagination ... },
  "errors": [ { "code": "...", "message": "...", "details": { ... } } ]
}
```
Authentication required unless otherwise stated.

## Authentication
- `POST /api/admin/login`
  - body: `{ "username": "", "password": "" }`
  - response: `{ "data": { "token": "jwt", "refresh_token": "..." } }`
- `POST /api/admin/logout`
- `POST /api/admin/refresh`
- `GET /api/admin/profile`

## Admin Database Instances
- `GET /api/admin/db-instances`
- `POST /api/admin/db-instances`
- `PATCH /api/admin/db-instances/{id}`
- `DELETE /api/admin/db-instances/{id}`
- `POST /api/admin/db-instances/{id}/test`
- `POST /api/admin/db-instances/{id}/init`
- `GET /api/admin/db-instances/{id}/init-jobs`

Instance payload fields:
```
{
  "name": "Northwind PG",
  "engine": "postgres" | "mysql",
  "host": "",
  "port": 5432,
  "database": "",
  "username": "",
  "password": "",
  "timeout_seconds": 6,
  "max_rows": 1000,
  "max_concurrency": 5,
  "rate_limit_per_minute": 30,
  "tags": ["pg_default"],
  "notes": ""
}
```

## Admin Question Bank
- `GET /api/admin/questions`
- `POST /api/admin/questions`
- `PATCH /api/admin/questions/{id}`
- `DELETE /api/admin/questions/{id}`
- `POST /api/admin/questions/import`
- `GET /api/admin/questions/export`
- `GET /api/admin/question-import-jobs`

Question payload fields align with the template (`question_id`, `title`, ...).

## Admin Logs & Settings
- `GET /api/admin/settings`
- `PATCH /api/admin/settings`
  - configurable keys: `default_timeout_seconds`, `default_max_rows`, `default_concurrency`, `rate_limit_per_minute`, `log_retention_days`.
- `GET /api/admin/execution-logs`
  - query params: `from`, `to`, `question_id`, `instance_id`, `status`, `page`, `page_size`.
- `GET /api/admin/audit-logs`
- `GET /api/admin/logs/export`
  - query: `type=execution|audit`, same filters as list.

## Practice Endpoints (No Auth)
- `GET /api/questions`
  - query: `category`, `difficulty`, `instance_tag`, `search`, `page`, `page_size`.
- `GET /api/questions/{question_id}`
  - returns question detail plus reference answers per allowed engine.
- `POST /api/questions/{question_id}/execute`
  - body: `{ "sql": "SELECT ...", "instance_tag": "pg_default" }`
  - response: `{ "data": { "columns": [...], "rows": [...], "truncated": false, "execution_time_ms": 120 } }`
  - errors: `timeout`, `syntax_error`, `forbidden_keyword`, `rate_limited`.

## Error Codes
- `AUTH_INVALID`, `AUTH_EXPIRED`
- `BAD_REQUEST`, `VALIDATION_FAILED`
- `NOT_FOUND`
- `FORBIDDEN`, `RATE_LIMITED`
- `TIMEOUT`, `QUERY_REJECTED`
- `INIT_IN_PROGRESS`, `INIT_FAILED`
- `INTERNAL_SERVER_ERROR`

## Permissions Summary
- Practice endpoints: anonymous access, rate limited.
- Admin endpoints: require valid admin JWT/session and CSRF token for state-changing operations.
- Import/Export operations logged with operator ID and timestamp.
