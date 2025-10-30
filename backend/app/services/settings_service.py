"""Service helpers for application settings."""
from __future__ import annotations

from typing import Any

from sqlalchemy.orm import Session

from backend.app.core.config import settings as app_settings
from backend.app.models import AppSetting

DEFAULT_KEYS = {
    "default_timeout_seconds": app_settings.default_timeout_seconds,
    "default_max_rows": app_settings.default_max_rows,
    "default_concurrency_limit": app_settings.default_concurrency_limit,
    "rate_limit_per_minute": app_settings.rate_limit_per_minute,
    "log_retention_days": app_settings.log_retention_days,
}


def get_settings(session: Session) -> dict[str, Any]:
    stored = {row.key: row.value for row in session.query(AppSetting).all()}
    merged = DEFAULT_KEYS.copy()
    merged.update({key: value for key, value in stored.items() if value is not None})
    return merged


def update_settings(session: Session, payload: dict[str, Any]) -> dict[str, Any]:
    for key, value in payload.items():
        setting = session.get(AppSetting, key)
        if setting is None:
            setting = AppSetting(key=key, value=value)
        else:
            setting.value = value
        session.add(setting)
    session.commit()
    return get_settings(session)


def get_setting_value(key: str) -> int:
    return DEFAULT_KEYS.get(key, 0)
