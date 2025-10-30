"""Application configuration settings."""
from functools import lru_cache
import json
from typing import Literal, Optional

from pydantic import AnyUrl, Field, PrivateAttr, field_validator
from pydantic_settings import BaseSettings, SettingsConfigDict


class Settings(BaseSettings):
    model_config = SettingsConfigDict(env_file=".env", env_file_encoding="utf-8", extra="ignore")

    app_name: str = "Northwind SQL Trainer"
    environment: Literal["dev", "staging", "prod"] = "dev"
    debug: bool = True

    secret_key: str = Field(default="change-me", description="Application secret for signing tokens")
    jwt_secret: str = Field(default="change-me-too", description="JWT signing key")
    jwt_algorithm: str = Field(default="HS256", description="JWT signing algorithm")
    access_token_expire_minutes: int = Field(default=30, ge=1, description="Access token lifetime in minutes")

    database_url: str = Field(default="postgresql+psycopg://local:local@localhost:5432/app_db")
    redis_url: Optional[AnyUrl] = Field(default=None, description="Redis URL for rate limiting and queues")
    encryption_key: str = Field(default="insecure-key", description="Key for encrypting external credentials")

    default_timeout_seconds: int = Field(default=6, ge=1, le=20)
    default_max_rows: int = Field(default=1000, ge=1)
    default_concurrency_limit: int = Field(default=5, ge=1)
    rate_limit_per_minute: int = Field(default=30, ge=1)
    log_retention_days: int = Field(default=7, ge=1)

    allowed_cors_origins_raw: Optional[str] = Field(default=None, alias="ALLOWED_CORS_ORIGINS", description="Raw origins value")
    _allowed_cors_origins: list[str] = PrivateAttr(default_factory=lambda: ["http://localhost:3000"])

    @staticmethod
    def _parse_cors_origins(value: Optional[str]) -> list[str]:
        default = ["http://localhost:3000"]
        if value is None:
            return default
        raw = value.strip()
        if not raw:
            return default
        if raw in {"*", "\"*\"", "'*'"}:
            return ["*"]
        if raw.startswith("["):
            try:
                parsed = json.loads(raw)
                if isinstance(parsed, list):
                    cleaned = [str(item).strip() for item in parsed if str(item).strip()]
                    return cleaned or default
            except json.JSONDecodeError:
                pass
        cleaned = [item.strip() for item in raw.split(",")]
        return [item for item in cleaned if item] or default

    @field_validator("allowed_cors_origins_raw", mode="after")
    @classmethod
    def _store_cors_origins(cls, value: Optional[str]) -> Optional[str]:
        return value

    def model_post_init(self, _context) -> None:
        self._allowed_cors_origins = self._parse_cors_origins(self.allowed_cors_origins_raw)

    @property
    def allowed_cors_origins(self) -> list[str]:
        return self._allowed_cors_origins[:]

    northwind_pg_script_path: str = Field(
        default="infrastructure/sql/northwind_pg.sql",
        description="Path to PostgreSQL Northwind initialization script",
    )
    northwind_mysql_schema_path: str = Field(
        default="infrastructure/sql/mysql/northwind.sql",
        description="Path to MySQL Northwind schema script",
    )
    northwind_mysql_data_path: str = Field(
        default="infrastructure/sql/mysql/northwind-data.sql",
        description="Path to MySQL Northwind data script",
    )


@lru_cache
def get_settings() -> Settings:
    """Return cached application settings."""
    return Settings()


settings = get_settings()
