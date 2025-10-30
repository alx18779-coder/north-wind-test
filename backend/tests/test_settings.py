from backend.app.core.config import settings


def test_default_settings_values() -> None:
    assert settings.default_timeout_seconds == 6
    assert settings.default_max_rows == 1000
    assert settings.default_concurrency_limit == 5
    assert settings.rate_limit_per_minute == 30
    assert settings.log_retention_days == 7
