"""Routes for managing database instances."""
from __future__ import annotations

from typing import List

from fastapi import APIRouter, Depends, HTTPException, status
from sqlalchemy.orm import Session

from backend.app.core import crypto
from backend.app.db.session import get_session
from backend.app.models import DatabaseInstance
from backend.app.schemas.database_instance import (
    DatabaseInstanceCreate,
    DatabaseInstanceOut,
    DatabaseInstanceUpdate,
)
from backend.app.schemas.db_init_job import DbInitJobOut
from backend.app.services import database_instance_service, init_service

router = APIRouter(prefix="/admin/db-instances", tags=["admin-db-instances"])


@router.get("/", response_model=List[DatabaseInstanceOut])
def list_instances(session: Session = Depends(get_session)) -> List[DatabaseInstance]:
    return database_instance_service.list_instances(session)

# 兼容无尾斜杠路径，避免代理/前端对尾斜杠的自动重定向造成循环
@router.get("", response_model=List[DatabaseInstanceOut])
def list_instances_no_slash(session: Session = Depends(get_session)) -> List[DatabaseInstance]:
    return database_instance_service.list_instances(session)


@router.post("/", response_model=DatabaseInstanceOut, status_code=status.HTTP_201_CREATED)
def create_instance(payload: DatabaseInstanceCreate, session: Session = Depends(get_session)) -> DatabaseInstance:
    return database_instance_service.create_instance(session, payload)

# 兼容无尾斜杠 POST /admin/db-instances
@router.post("", response_model=DatabaseInstanceOut, status_code=status.HTTP_201_CREATED)
def create_instance_no_slash(payload: DatabaseInstanceCreate, session: Session = Depends(get_session)) -> DatabaseInstance:
    return database_instance_service.create_instance(session, payload)


@router.get("/{instance_id}", response_model=DatabaseInstanceOut)
def get_instance(instance_id: int, session: Session = Depends(get_session)) -> DatabaseInstance:
    instance = database_instance_service.get_instance(session, instance_id)
    if instance is None:
        raise HTTPException(status_code=status.HTTP_404_NOT_FOUND, detail="Instance not found")
    return instance


@router.patch("/{instance_id}", response_model=DatabaseInstanceOut)
def update_instance(instance_id: int, payload: DatabaseInstanceUpdate, session: Session = Depends(get_session)) -> DatabaseInstance:
    instance = database_instance_service.get_instance(session, instance_id)
    if instance is None:
        raise HTTPException(status_code=status.HTTP_404_NOT_FOUND, detail="Instance not found")
    return database_instance_service.update_instance(session, instance, payload)


@router.delete("/{instance_id}", status_code=status.HTTP_204_NO_CONTENT)
def delete_instance(instance_id: int, session: Session = Depends(get_session)) -> None:
    instance = database_instance_service.get_instance(session, instance_id)
    if instance is None:
        raise HTTPException(status_code=status.HTTP_404_NOT_FOUND, detail="Instance not found")
    database_instance_service.delete_instance(session, instance)


@router.post("/{instance_id}/decrypt-password", response_model=str)
def decrypt_password(instance_id: int, session: Session = Depends(get_session)) -> str:
    instance = database_instance_service.get_instance(session, instance_id)
    if instance is None:
        raise HTTPException(status_code=status.HTTP_404_NOT_FOUND, detail="Instance not found")
    return crypto.decrypt(instance.password_encrypted)


@router.post("/{instance_id}/test", response_model=dict)
def test_connection(instance_id: int, session: Session = Depends(get_session)) -> dict:
    instance = database_instance_service.get_instance(session, instance_id)
    if instance is None:
        raise HTTPException(status_code=status.HTTP_404_NOT_FOUND, detail="Instance not found")
    success = database_instance_service.test_connection(session, instance)
    if not success:
        raise HTTPException(status_code=status.HTTP_503_SERVICE_UNAVAILABLE, detail="Connection failed")
    return {"status": "ok"}


@router.post("/{instance_id}/init", response_model=DbInitJobOut, status_code=status.HTTP_201_CREATED)
def create_init_job(instance_id: int, session: Session = Depends(get_session)) -> DbInitJobOut:
    instance = database_instance_service.get_instance(session, instance_id)
    if instance is None:
        raise HTTPException(status_code=status.HTTP_404_NOT_FOUND, detail="Instance not found")
    job = init_service.trigger_init_job(session, instance)
    return job


@router.get("/{instance_id}/init-jobs", response_model=list[DbInitJobOut])
def list_init_jobs(instance_id: int, session: Session = Depends(get_session)) -> list[DbInitJobOut]:
    instance = database_instance_service.get_instance(session, instance_id)
    if instance is None:
        raise HTTPException(status_code=status.HTTP_404_NOT_FOUND, detail="Instance not found")
    return init_service.list_jobs_for_instance(session, instance.id)
