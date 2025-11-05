#!/usr/bin/env python3
"""
Simple MySQL connectivity tester that is safe for passwords containing special characters (e.g., @ : / # ?).

Usage:
  .venv/bin/python scripts/test_mysql_connection.py \
    --host 127.0.0.1 --port 3306 --user root --password 'p@ss:w/rd#?' --database northwind

It will:
  1) Build a SQLAlchemy URL via URL.create (handles escaping)
  2) Connect with SQLAlchemy and run SELECT 1
  3) Connect with PyMySQL directly and run SELECT 1
Exit code is non‑zero on failure.
"""
from __future__ import annotations

import argparse
import sys

from sqlalchemy import text
from sqlalchemy.engine import URL, create_engine


def main() -> int:
    parser = argparse.ArgumentParser(description="MySQL connectivity test")
    parser.add_argument("--host", required=True)
    parser.add_argument("--port", type=int, default=3306)
    parser.add_argument("--user", required=True)
    parser.add_argument("--password", required=True)
    parser.add_argument("--database", required=True)
    args = parser.parse_args()

    # 1) Build DSN via URL.create (escapes special characters)
    url = URL.create(
        drivername="mysql+pymysql",
        username=args.user,
        password=args.password,
        host=args.host,
        port=args.port,
        database=args.database,
    )
    print(f"SQLAlchemy URL: {url}")

    # 2) SQLAlchemy connect
    try:
        engine = create_engine(url, pool_pre_ping=True, future=True)
        with engine.connect() as conn:
            value = conn.execute(text("SELECT 1")).scalar_one()
            print("SQLAlchemy SELECT 1 =>", value)
    except Exception as exc:
        print("[ERROR] SQLAlchemy connect failed:", exc, file=sys.stderr)
        return 2
    finally:
        try:
            engine.dispose()
        except Exception:
            pass

    # 3) PyMySQL direct connect (for double check)
    try:
        import pymysql

        conn = pymysql.connect(
            host=args.host,
            port=args.port,
            user=args.user,
            password=args.password,
            database=args.database,
            charset="utf8mb4",
            connect_timeout=5,
        )
        with conn.cursor() as cur:
            cur.execute("SELECT 1")
            print("PyMySQL SELECT 1 =>", cur.fetchone()[0])
        conn.close()
    except Exception as exc:
        print("[WARN] PyMySQL direct connect failed:", exc, file=sys.stderr)
        # keep non‑fatal since SQLAlchemy already succeeded

    print("Connection test OK")
    return 0


if __name__ == "__main__":
    raise SystemExit(main())

