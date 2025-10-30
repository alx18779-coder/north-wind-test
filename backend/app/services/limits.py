"""Rate limiting and concurrency controls for query execution."""
from __future__ import annotations

import threading
import time
from collections import defaultdict, deque
from contextlib import contextmanager
from typing import Deque, Dict, Iterator

from backend.app.core.config import settings


class RateLimiter:
    def __init__(self) -> None:
        self._records: Dict[str, Deque[float]] = defaultdict(deque)
        self._lock = threading.Lock()

    def check(self, key: str, limit: int, window_seconds: int = 60) -> tuple[bool, float | None]:
        now = time.time()
        with self._lock:
            window = self._records[key]
            while window and now - window[0] > window_seconds:
                window.popleft()
            if len(window) >= limit:
                retry_after = window_seconds - (now - window[0])
                return False, max(retry_after, 0)
            window.append(now)
        return True, None


class ConcurrencyLimiter:
    def __init__(self) -> None:
        self._semaphores: Dict[str, tuple[int, threading.Semaphore]] = {}
        self._lock = threading.Lock()

    @contextmanager
    def acquire(self, key: str, limit: int) -> Iterator[None]:
        with self._lock:
            sem_info = self._semaphores.get(key)
            if sem_info is None or sem_info[0] != limit:
                sem = threading.Semaphore(limit)
                self._semaphores[key] = (limit, sem)
            else:
                sem = sem_info[1]
        sem.acquire()
        try:
            yield
        finally:
            sem.release()


rate_limiter = RateLimiter()
concurrency_limiter = ConcurrencyLimiter()


def get_rate_limit() -> int:
    return settings.rate_limit_per_minute
