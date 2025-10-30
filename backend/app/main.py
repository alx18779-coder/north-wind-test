"""FastAPI application entry point."""
from fastapi import FastAPI
from fastapi.middleware.cors import CORSMiddleware

from .api.router import api_router
from .core.config import settings
from .db.session import SessionLocal
from .services import admin_service


def create_app() -> FastAPI:
    """Create and configure FastAPI application instance."""
    app = FastAPI(
        title=settings.app_name,
        version="0.1.0",
        docs_url="/docs",
        redoc_url="/redoc",
        openapi_url="/openapi.json",
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
        finally:
            session.close()

    app.include_router(api_router, prefix="/api")
    return app


app = create_app()
