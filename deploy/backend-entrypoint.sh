#!/usr/bin/env bash
set -euo pipefail

# 等待数据库就绪（最多 60s）
echo "[entrypoint] waiting for database ..."
python - <<'PY'
import os, time
from sqlalchemy import create_engine, text
url = os.environ.get('DATABASE_URL', 'postgresql+psycopg://app:app@app_db:5432/appdb')
eng = create_engine(url, pool_pre_ping=True, future=True)
deadline = time.time() + 60
while True:
    try:
        with eng.connect() as c:
            c.execute(text('SELECT 1'))
        print('[entrypoint] database ready')
        break
    except Exception as e:
        if time.time() > deadline:
            raise
        time.sleep(1)
PY

echo "[entrypoint] running alembic upgrade ..."
python -m alembic upgrade head || true

echo "[entrypoint] starting server ..."
exec "$@"

