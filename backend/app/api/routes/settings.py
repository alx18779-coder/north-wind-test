"""Admin settings routes."""
from __future__ import annotations

from fastapi import APIRouter, Depends
from sqlalchemy.orm import Session

from backend.app.db.session import get_session
from backend.app.services.settings_service import get_settings, update_settings

router = APIRouter(prefix="/admin/settings", tags=["admin-settings"])


@router.get("/")
def read_settings(session: Session = Depends(get_session)) -> dict[str, int]:
    return get_settings(session)

# 兼容无尾斜杠 GET /admin/settings
@router.get("")
def read_settings_no_slash(session: Session = Depends(get_session)) -> dict[str, int]:
    return get_settings(session)


@router.patch("/")
def patch_settings(payload: dict[str, int], session: Session = Depends(get_session)) -> dict[str, int]:
    return update_settings(session, payload)

# 兼容无尾斜杠 PATCH /admin/settings
@router.patch("")
def patch_settings_no_slash(payload: dict[str, int], session: Session = Depends(get_session)) -> dict[str, int]:
    return update_settings(session, payload)
