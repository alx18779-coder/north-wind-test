# 快速上手（两种部署方式）

本文提供两种方式启动本项目：
- 方式 A：手动部署（更灵活，适合开发调试）
- 方式 B：一站式 docker-compose（更省心，适合快速体验）

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
   - PostgreSQL 示例：标签 `pg_default`
   - MySQL 示例：标签 `mysql_default`
3. 导入题库：在“题库导入”使用 `docs/questions_pg.csv` 与 `docs/questions_mysql.csv`，先“校验并预览”，再“导入”。

---

## 方式 B：一站式 docker-compose（含数据库 + 后端 + 前端）

前置要求
- Docker 24+ 与 Docker Compose v2+

### 1) 启动所有服务
```bash
docker compose up -d
```

启动后包含：
- `app_db`：系统库 PostgreSQL（保存用户、题库、日志等）
- `northwind_pg`：练习用 PG 数据库（自动导入 Northwind）
- `northwind_mysql`：练习用 MySQL 数据库（自动导入 Northwind）
- `backend`：FastAPI API（端口 10000）
- `frontend`：Next.js 前端（端口 3000）

### 2) 首次登录与配置
1. 打开 http://localhost:3000/login 使用 `admin/admin` 登录并立即修改密码。
2. 在“数据库实例”新增两条记录（主机名用容器内 DNS 名称）：
   - Northwind PG：
     - 引擎：`postgres`
     - 主机：`northwind_pg`，端口：`5432`，数据库：`northwind`
     - 用户/密码：`northwind` / `northwind`
     - 标签：`pg_default`
   - Northwind MySQL：
     - 引擎：`mysql`
     - 主机：`northwind_mysql`，端口：`3306`，数据库：`northwind`
     - 用户/密码：`northwind` / `northwind`
     - 标签：`mysql_default`
3. 题库导入：
   - 使用 `docs/questions_pg.csv` 与 `docs/questions_mysql.csv` 分别导入。

### 3) 典型命令
```bash
# 查看日志
docker compose logs -f backend
docker compose logs -f frontend

# 停止与清理
docker compose down             # 仅停容器
docker compose down -v          # 连同卷一起清理（含数据库数据）
```

> 注意：compose 文件用于开发/体验环境。生产建议：固定镜像版本、使用反向代理（如 Nginx/Caddy）、在云服务或 k8s 上管理密钥与持久化卷。
