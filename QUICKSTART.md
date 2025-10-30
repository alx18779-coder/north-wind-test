# 快速上手说明

## 启动后台（FastAPI）
1.（可选）创建并激活 Python 虚拟环境：
   ```bash
   uv venv .venv
   source .venv/bin/activate
   ```
2. 安装依赖：
   ```bash
   uv pip install --python .venv/bin/python -e .
   ```
3. 配置环境变量：
   - 将 `.env.example` 复制为 `.env`
   - 按需修改 `DATABASE_URL`（需指向已存在的 PostgreSQL 库）、Redis、JWT 等参数
4. 执行数据库迁移：
   ```bash
   .venv/bin/alembic upgrade head
   ```
5. 启动 FastAPI 服务：
   ```bash
   .venv/bin/uvicorn backend.app.main:app --reload --host 0.0.0.0 --port 8000
   ```
   接口文档地址：http://localhost:8000/docs

6. 首次启动时系统会自动创建默认管理员：用户名 `admin`、密码 `admin`。请通过管理员界面或调用 `/api/admin/auth/change-password` 接口尽快修改为强密码。

## 启动前台（Next.js）
1. 进入 `frontend/` 目录安装依赖：
   ```bash
   pnpm install   # 或 npm install / yarn install
   ```
2. 新建 `.env.local`，写入后端 API 地址：
   ```bash
   NEXT_PUBLIC_API_BASE_URL=http://localhost:8000/api
   ```
3. 启动开发服务器：
   ```bash
   pnpm dev
   ```
   浏览器访问：http://localhost:3000
4. 管理端登录地址：http://localhost:3000/login，使用默认管理员账号登陆后可在“系统设置”页面修改密码。
