# 快速上手（手动 / 生产镜像 / 本地 compose）

本文提供三种方式启动本项目：
- 方式 A：手动部署（更灵活，适合开发调试）
- 方式 B：生产部署（直接使用 Docker Hub 镜像）
- 方式 C：本地源码 compose（便捷开发环境）

---

## 方式 A：手动部署（后端 + 前端）

前置要求
- Python 3.11+
- Node.js 20+ 与 pnpm（或 npm/yarn）

### 1) 启动后端（FastAPI）
1.（推荐）创建虚拟环境并激活：
   ```bash
   uv venv .venv && source .venv/bin/activate
   ```
2. 安装依赖：
   ```bash
   uv sync
   ```
3. 配置环境变量：
   - 复制 `.env.example` 为 `.env`
   - 至少设置：
     - `DB_APP_URL`：系统库 PostgreSQL 连接串，例如：`postgresql+psycopg://app:app@localhost:5432/appdb`
     - `APP_SECRET_KEY`、`JWT_SECRET`、`ENCRYPTION_KEY`：自行生成安全值
     - `ALLOWED_CORS_ORIGINS`：如 `["http://localhost:3000"]`
4. 初始化数据库（Alembic 迁移）：
   ```bash
   uv run alembic upgrade head
   ```
5. 启动 API：
   ```bash
   uv run uvicorn backend.app.main:app --reload --host 0.0.0.0 --port 10000
   ```
   文档地址：http://localhost:10000/docs

提示：首次启动会存在默认管理员 `admin/admin`，请立刻修改密码。

### 2) 启动前端（Next.js）
1. 安装依赖：
   ```bash
   cd frontend && pnpm install
   ```
2. 新建环境文件 `frontend/.env.local`：
   ```bash
   NEXT_PUBLIC_API_BASE_URL=http://localhost:10000/api
   ```
3. 启动开发服务器：
   ```bash
   pnpm dev
   ```
   访问：http://localhost:3000

### 3) 配置练习实例与题库（手动方式）
1. 用管理员登录前端（/login）。
2. 在“数据库实例”中新建实例：
   - PostgreSQL 示例：标签建议用 `pg_default`
   - MySQL 示例：标签建议用 `mysql_default`
  3. 导入题库：在“题库导入”使用 `docs/questions_pg.csv` 与 `docs/questions_mysql.csv`，先“校验并预览”，再“导入”。

---

## 方式 B：生产部署（使用 Docker Hub 镜像）

前置要求
- Docker 24+ 与 Docker Compose v2+
- 可访问 Docker Hub 仓库：`candy0327/north-wind-test`

镜像标签说明（示例）
- 后端：`candy0327/north-wind-test:backend-<TAG>`（如 `backend-latest`、`backend-<commit-sha>`）
- 前端：`candy0327/north-wind-test:frontend-<TAG>`（如 `frontend-latest`、`frontend-<commit-sha>`）

### 1) 一键启动（推荐）
使用仓库根目录的 `docker-compose.prod.yaml`，支持通过 `TAG` 环境变量指定版本（默认 `latest`）。

```bash
# 使用 latest 标签
docker compose -f docker-compose.prod.yaml up -d

# 或指定某个版本标签（示例：v1.0.0）
TAG=v1.0.0 docker compose -f docker-compose.prod.yaml up -d
```

启动服务包含：
- `app_db`：系统库 PostgreSQL（保存管理员、题库、日志等）
- `backend`：FastAPI API（端口 10000）
- `frontend`：Next.js 前端（端口 3000）

### 2) 健康检查
```bash
curl -i http://<服务器IP>:10000/api/health/ready
curl -i http://<服务器IP>:3000/api/health/ready
```

### 3) 首次登录与练习实例配置
1. 打开 `http://<服务器IP>:3000/login`，使用 `admin/admin` 登录并立即修改密码。
2. 在“数据库实例”页面新增你自己的练习库连接（项目不再内置 Northwind 容器）：
   - PostgreSQL：标签建议 `pg_default`
   - MySQL：标签建议 `mysql_default`
3. 点击“测试连接”应为“连接成功”，如需初始化 Northwind 示例数据，点击“执行初始化”。

> 说明：前端默认同源请求 `/api`，由 Next 服务器代理到 `backend:10000/api`，无需硬编码后端 IP。

### 4) 常用命令
```bash
# 查看日志
docker compose -f docker-compose.prod.yaml logs -f backend
docker compose -f docker-compose.prod.yaml logs -f frontend

# 停止与清理
docker compose -f docker-compose.prod.yaml down             # 仅停容器
docker compose -f docker-compose.prod.yaml down -v          # 连同卷一起清理（含数据库数据）
```

### 5) 可选：.env 覆盖（生产建议使用）
在 `docker-compose.prod.yaml` 同目录放置 `.env`，覆盖默认值（示例）：

```env
ENVIRONMENT=prod
SECRET_KEY=请替换为强随机值
JWT_SECRET=请替换为强随机值
ENCRYPTION_KEY=请替换为强随机值
DATABASE_URL=postgresql+psycopg://app:app@app_db:5432/appdb
ALLOWED_CORS_ORIGINS=["http://你的域名或IP:3000"]
```

> 数字类变量请不要加引号，例如：`DEFAULT_MAX_ROWS=1000`。

---

## 方式 C：本地源码 compose（开发场景）

前置要求
- Docker 24+ 与 Docker Compose v2+

### 1) 启动
```bash
docker compose up -d
```

包含服务：
- `app_db`、`backend`、`frontend`（源码以卷挂载，前后端支持热更新）

### 2) 登录与练习库配置
- 登录信息同上：`admin/admin`
- 在“数据库实例”中添加你可达的 PostgreSQL / MySQL，标签建议 `pg_default` / `mysql_default`，然后“测试连接”“执行初始化”。

### 3) 常见问题
- 如果希望彻底清空数据重新来过：
  ```bash
  docker compose down -v && docker volume rm north-wind-test_app_db_data || true
  docker compose up -d
  ```
