"""Administrator authentication endpoints."""
from __future__ import annotations

from fastapi import APIRouter, Depends, HTTPException, Response, status
from sqlalchemy.orm import Session

from backend.app.core.config import settings
from backend.app.core.security import create_access_token, verify_password
from backend.app.db.session import get_session
from backend.app.schemas.auth import AdminChangePasswordRequest, AdminLoginRequest, TokenResponse
from backend.app.services import admin_service, log_service

router = APIRouter(prefix="/admin/auth", tags=["admin-auth"])


@router.post("/login", response_model=TokenResponse, summary="Administrator login")
def login(payload: AdminLoginRequest, session: Session = Depends(get_session)) -> TokenResponse:
    user = admin_service.get_admin_by_username(session, payload.username)
    if user is None or not verify_password(payload.password, user.password_hash):
        raise HTTPException(status_code=status.HTTP_401_UNAUTHORIZED, detail="Invalid credentials")

    token = create_access_token({"sub": str(user.id), "username": user.username})
    return TokenResponse(access_token=token, expires_in=settings.access_token_expire_minutes * 60)


@router.post("/change-password", status_code=status.HTTP_204_NO_CONTENT, summary="Change administrator password")
def change_password(payload: AdminChangePasswordRequest, session: Session = Depends(get_session)) -> Response:
    user = admin_service.get_admin_by_username(session, payload.username)
    if user is None or not verify_password(payload.current_password, user.password_hash):
        raise HTTPException(status_code=status.HTTP_401_UNAUTHORIZED, detail="Invalid credentials")

    admin_service.update_password(session, user, payload.new_password)
    log_service.record_audit_log(
        session,
        action="admin_password_change",
        target_type="admin_user",
        target_id=str(user.id),
        success=True,
        admin_user_id=user.id,
    )
    return Response(status_code=status.HTTP_204_NO_CONTENT)
