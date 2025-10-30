"""Add database initialization jobs table."""
from __future__ import annotations

import sqlalchemy as sa
from alembic import op

# revision identifiers, used by Alembic.
revision = "0003_db_init_jobs"
down_revision = "0002_question_bank_and_logs"
branch_labels = None
depends_on = None


def upgrade() -> None:
    op.create_table(
        "db_init_jobs",
        sa.Column("id", sa.Integer(), primary_key=True),
        sa.Column("instance_id", sa.Integer(), nullable=False),
        sa.Column("status", sa.String(length=50), nullable=False, server_default="queued"),
        sa.Column("created_at", sa.DateTime(timezone=True), nullable=False, server_default=sa.func.now()),
        sa.Column("completed_at", sa.DateTime(timezone=True), nullable=True),
        sa.Column("log", sa.Text(), nullable=True),
        sa.ForeignKeyConstraint(["instance_id"], ["database_instances.id"], ondelete="CASCADE"),
    )


def downgrade() -> None:
    op.drop_table("db_init_jobs")
