"""FastAPI application entry point."""
from fastapi import FastAPI
from fastapi.middleware.cors import CORSMiddleware

from .api.router import api_router
from .core.config import settings
from .db.session import SessionLocal
from .services import admin_service
from .services.bootstrap_questions import ensure_default_questions


def create_app() -> FastAPI:
    """Create and configure FastAPI application instance."""
    # 在生产环境关闭交互式文档与 OpenAPI 输出，避免在公网暴露接口清单
    is_prod = settings.environment == "prod"
    app = FastAPI(
        title=settings.app_name,
        version="0.1.0",
        docs_url=None if is_prod else "/docs",
        redoc_url=None if is_prod else "/redoc",
        openapi_url=None if is_prod else "/openapi.json",
    )

    allow_origins = settings.allowed_cors_origins
    allow_origin_regex = None
    allow_credentials = True
    if len(allow_origins) == 1 and allow_origins[0] == "*":
        allow_origin_regex = ".*"
        allow_origins = []
        allow_credentials = False

    app.add_middleware(
        CORSMiddleware,
        allow_origins=allow_origins,
        allow_origin_regex=allow_origin_regex,
        allow_credentials=allow_credentials,
        allow_methods=["*"],
        allow_headers=["*"],
    )

    @app.get("/", tags=["meta"], summary="Service metadata")
    async def root() -> dict[str, str]:
        """Report basic service metadata."""
        return {
            "name": settings.app_name,
            "environment": settings.environment,
            "status": "running",
        }

    @app.on_event("startup")
    def bootstrap_defaults() -> None:
        session = SessionLocal()
        try:
            admin_service.ensure_default_admin(session)
            try:
                summary = ensure_default_questions(session)
                # 简单输出到控制台，便于 docker logs 可见
                print({"bootstrap_questions": summary})
            except Exception as exc:  # pragma: no cover - 不因导入失败阻断服务
                print({"bootstrap_questions_error": str(exc)})
        finally:
            session.close()

    app.include_router(api_router, prefix="/api")
    return app


app = create_app()
