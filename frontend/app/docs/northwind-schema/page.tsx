import fs from "node:fs";
import path from "node:path";

export const dynamic = "force-static";

export default function NorthwindSchemaPage() {
  const root = process.cwd();
  const candidates = [
    // 源码/开发：前端工作目录外一层
    path.resolve(root, "../infrastructure/sql/northwind_pg.sql"),
    // 生产容器常见路径（Dockerfile.frontend COPY 目标）
    "/app/infrastructure/sql/northwind_pg.sql",
    // 静态资源目录（如通过 public/sql 提供下载）
    path.resolve(root, "public/sql/northwind_pg.sql"),
  ];
  let ddl = "";
  let found = false;
  for (const p of candidates) {
    try {
      if (fs.existsSync(p)) {
        ddl = fs.readFileSync(p, "utf-8");
        found = true;
        break;
      }
    } catch {
      // continue
    }
  }
  if (!found) {
    ddl =
      "未找到 DDL 文件。请确认容器内存在 /app/infrastructure/sql/northwind_pg.sql 或已将文件放在 public/sql/northwind_pg.sql。";
  }

  return (
    <section className="mx-auto max-w-5xl px-6 py-10">
      <div className="flex items-start justify-between gap-4">
        <div>
          <h1 className="text-2xl font-semibold text-slate-50">Northwind 表结构（PostgreSQL DDL）</h1>
          <p className="mt-2 text-sm text-slate-400">
            以下为仓库提供的 Northwind PostgreSQL 初始化脚本节选，便于快速查阅表定义与外键约束。
          </p>
        </div>
        <div className="flex gap-2">
          <a
            href="/sql/northwind_pg.sql"
            className="rounded border border-slate-700 px-3 py-1 text-xs text-slate-200 hover:bg-slate-800"
          >
            下载 PostgreSQL SQL 文件
          </a>
          <a
            href="/sql/northwind_mysql.sql"
            className="rounded border border-slate-700 px-3 py-1 text-xs text-slate-200 hover:bg-slate-800"
          >
            下载 MySQL SQL 文件
          </a>
        </div>
      </div>
      <div className="mt-4 rounded border border-slate-800 bg-slate-900/60 p-4">
        <pre className="max-h-[70vh] overflow-auto text-xs leading-5 text-slate-200">
          {ddl}
        </pre>
      </div>
    </section>
  );
}
