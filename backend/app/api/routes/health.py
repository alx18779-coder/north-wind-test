"""Health check and metadata endpoints."""
from fastapi import APIRouter

router = APIRouter(prefix="/health", tags=["health"])


@router.get("/ready", summary="Readiness probe")
async def readiness_check() -> dict[str, str]:
    """Return readiness status."""
    return {"status": "ok"}


@router.get("/live", summary="Liveness probe")
async def liveness_check() -> dict[str, str]:
    """Return liveness status."""
    return {"status": "alive"}
