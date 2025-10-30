"""Background worker for database initialization jobs."""
from __future__ import annotations

from concurrent.futures import ThreadPoolExecutor

from backend.app.db.session import SessionLocal
from backend.app.services import init_service

_executor = ThreadPoolExecutor(max_workers=2)


def enqueue_job(job_id: int) -> None:
    _executor.submit(_run_job, job_id)


def _run_job(job_id: int) -> None:
    session = SessionLocal()
    try:
        init_service.run_init_job_by_id(session, job_id)
    finally:
        session.close()
