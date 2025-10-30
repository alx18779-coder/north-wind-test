# Security, Safety & Logging Strategy

## SQL Execution Guardrails
- Accept only single-statement `SELECT` queries; Common Table Expressions (CTE) allowed if final statement is `SELECT`.
- Block disallowed keywords: `INSERT`, `UPDATE`, `DELETE`, `MERGE`, `CREATE`, `ALTER`, `DROP`, `TRUNCATE`, `GRANT`, `REVOKE`, `EXEC`, `CALL`.
- Reject statements containing multiple semicolons, comments that hide keywords, or transaction control (`BEGIN`, `COMMIT`, `ROLLBACK`).
- Enforce strict parsing using SQL parser or database EXPLAIN dry-run; fallback regex used only for quick screening.
- Limit returned rows to configurable maximum (default 1000); mark payload with `truncated = true` when exceeded.
- Apply database-level credentials with read-only permissions; separate users for PostgreSQL and MySQL instances.

## Resource Limits
- Default timeout 6 seconds per query; configurable range 1–20 seconds via admin settings.
- Application-layer watchdog aborts requests exceeding timeout and closes connection.
- Per-instance concurrency limit default 5 active executions; queue additional requests or return 429 with retry message.
- Rate limiting per IP: default 30 executions per minute; store counters in Redis.

## Authentication & Session Management
- Administrator passwords stored using bcrypt/PBKDF2 with configurable cost and per-user salt.
- JWT access tokens (short lived) plus refresh tokens or server-maintained sessions with sliding expiration.
- CSRF protection via SameSite cookies + synchronizer token pattern for state-changing POST/PUT/PATCH/DELETE.
- Enforce HTTPS, secure cookies, standard security headers (HSTS, X-Content-Type-Options, X-Frame-Options, CSP baseline).

## Logging & Auditing
- Execution logs: timestamp, question ID, instance tag, SQL hash + raw (capped length), result type, duration, row count, truncation flag, client IP, user agent.
- Audit logs: admin user, action, target entity, before/after snapshot (when safe), success/failure outcome, originating IP.
- Retention: 7 days for both log types; nightly job purges older entries.
- Export: admin-only endpoint delivering CSV or JSON, filtered by date range and identifiers; export actions recorded in audit logs.
- Sensitive data protection: mask credentials in logs; never store plaintext passwords or connection strings in audit entries.

## Infrastructure & Configurations
- Secrets (system DB, JWT keys, encryption key) provided via environment variables or secret manager; not editable in admin UI.
- Docker containers run non-root users; database data directories mapped to persistent volumes.
- Health checks monitor instance availability, last initialization result, and query timeout frequency; failures raise alerts.
- Optional alert integrations (email/webhook) for repeated timeouts, initialization failures, or rate-limit breaches.

## Compliance & Privacy
- Anonymous practice: no personal data stored for learners beyond IP and execution metadata for security.
- Provide admin controls to delete execution logs on demand (within retention policy).
- Document policy in public-facing terms if required.
