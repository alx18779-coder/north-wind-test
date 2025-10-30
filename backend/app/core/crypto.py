"""Credential encryption utilities."""
from __future__ import annotations

import base64
from cryptography.fernet import Fernet, InvalidToken

from backend.app.core.config import settings

_key = base64.urlsafe_b64encode(settings.encryption_key.encode("utf-8").ljust(32, b"0")[:32])
fernet = Fernet(_key)


def encrypt(value: str) -> str:
    token = fernet.encrypt(value.encode("utf-8"))
    return token.decode("utf-8")


def decrypt(token: str) -> str:
    try:
        value = fernet.decrypt(token.encode("utf-8"))
        return value.decode("utf-8")
    except InvalidToken as exc:  # pragma: no cover - indicates corrupted data
        raise ValueError("Invalid encrypted token") from exc
