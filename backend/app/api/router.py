"""Aggregate API router."""
from fastapi import APIRouter

from .routes import admin_auth, database_instances, health, logs, practice, questions, settings

api_router = APIRouter()
api_router.include_router(health.router)
api_router.include_router(admin_auth.router)
api_router.include_router(database_instances.router)
api_router.include_router(questions.router)
api_router.include_router(logs.router)
api_router.include_router(settings.router)
api_router.include_router(practice.router)
