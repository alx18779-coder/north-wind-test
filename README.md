Northwind SQL 实战平台（前后端一体）

本仓库包含：
- 后端：FastAPI + SQLAlchemy（目录：`backend/`）
- 前端：Next.js 14 + React 18（目录：`frontend/`）
- 数据脚本：Northwind 的 PostgreSQL/MySQL 脚本（目录：`infrastructure/sql/`）。其中 MySQL 仅保留合并版脚本 `infrastructure/sql/northwind_mysql.sql`（已移除 `infrastructure/sql/mysql/` 拆分脚本）。
- 文档：产品与运维文档（目录：`docs/`）

部署提供两种方式：
- 手动部署（灵活）：本机分别启动后端与前端，自行配置 `.env` 与数据库。
- 一站式部署（省心）：使用 `docker-compose` 一键拉起数据库、后端与前端。

快速开始与完整步骤请见：`QUICKSTART.md`。

常用链接
- 开发后端（默认端口 10000）：http://localhost:10000/docs
- 开发前端（默认端口 3000）：http://localhost:3000
- 管理后台登录：http://localhost:3000/login（默认 `admin/admin`，部署后请立即修改密码）

问题反馈与计划
- 路线图与未完事项：`docs/roadmap.md`、`docs/stage1-summary.md`
- 配置说明与默认值：`docs/configuration.md`
