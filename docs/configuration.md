# Configuration & Defaults

## System Defaults
- Query timeout: **6 seconds** (range 1–20). Adjustable per instance and globally.
- Maximum result rows: **1000**. Executions exceeding the limit return truncated flag.
- Max concurrent executions per instance: **5**.
- Rate limit per IP: **30 executions per minute**.
- Log retention: **7 days** for execution and audit logs.

## Environment Variables
| Variable | Description |
| --- | --- |
| `APP_ENV` | Environment name (`dev`, `staging`, `prod`). |
| `APP_SECRET_KEY` | Application secret for signing. |
| `JWT_SECRET` / `JWT_EXPIRES_IN` | JWT signing key and TTL. |
| `DB_APP_URL` | System database (PostgreSQL) connection string. |
| `ENCRYPTION_KEY` | Key for encrypting instance credentials. |
| `CELERY_BROKER_URL` | Redis/AMQP broker for background jobs. |
| `CELERY_RESULT_BACKEND` | Result backend (Redis recommended). |
| `REDIS_RATE_LIMIT_URL` | Redis instance for rate limiting counters. |
| `DEFAULT_TIMEOUT_SECONDS` | Override default query timeout. |
| `DEFAULT_MAX_ROWS` | Override default row cap. |
| `DEFAULT_CONCURRENCY_LIMIT` | Override default concurrency per instance. |
| `DEFAULT_RATE_LIMIT_PER_MINUTE` | Override default rate limit per IP. |
| `LOG_RETENTION_DAYS` | Override log retention duration. |
| `ADMIN_SEED_USERNAME` / `ADMIN_SEED_PASSWORD` | Optional seed admin credentials. |
| `ALLOWED_CORS_ORIGINS` | JSON 数组格式的来源列表，允许哪些前端域名访问 API。默认：`["http://localhost:3000"]`。 |

默认情况下，系统会在启动时确保存在用户名为 `admin` 的管理员账号，并将其密码设为 `admin`。部署后请立即通过 `/api/admin/auth/change-password` 接口或管理界面修改为强密码，并通知其他管理员使用新凭据。

## Admin Configurable Settings
Stored in `app_settings` and editable via admin UI:
- `default_timeout_seconds`
- `default_max_rows`
- `default_concurrency_limit`
- `rate_limit_per_minute`
- `log_retention_days`

Changes trigger cache refresh and propagate to execution service without restart.

## Docker Compose Services
- `backend`: FastAPI application, exposing REST APIs.
- `frontend`: React/Next.js application served by Node/SSR.
- `worker`: Celery/RQ worker for background jobs (initialization, cleanup).
- `redis`: Broker + rate limiting store.
- `app_db`: PostgreSQL instance storing system tables.
- `northwind_pg`: PostgreSQL instance preloaded for development testing.
- `northwind_mysql`: MySQL instance preloaded for development testing.

Persistent volumes recommended for `app_db`, optional for Northwind instances if reinitialization is frequent.

## Scheduled Jobs
- **Log Cleanup**: Runs daily at 02:00 server time, deletes records older than retention.
- **Instance Health Check**: Runs every 15 minutes, testing connectivity and recording latency.
- **Slow Query Alerting**: Aggregates execution logs hourly to surface high latency patterns (phase 2 enhancement).

## Secrets Management Recommendations
- Use `.env` only for local development; production environments should source from secret manager (Vault, AWS Secrets Manager, etc.).
- Rotate encryption keys and administrator passwords periodically; document rotation procedure.
- Audit secret access logs if platform provides them.
