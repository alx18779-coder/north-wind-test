import fs from "node:fs";
import path from "node:path";

export const dynamic = "force-static";

export default function NorthwindSchemaPage() {
  const root = process.cwd();
  const ddlPath = path.resolve(root, "../infrastructure/sql/northwind_pg.sql");
  let ddl = "";
  try {
    ddl = fs.readFileSync(ddlPath, "utf-8");
  } catch {
    ddl = "未找到 DDL 文件。请确认 infrastructure/sql/northwind_pg.sql 是否存在。";
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
            href="/docs/northwind-schema/download"
            className="rounded border border-slate-700 px-3 py-1 text-xs text-slate-200 hover:bg-slate-800"
          >
            下载 PostgreSQL SQL 文件
          </a>
          <a
            href="/docs/northwind-schema/mysql"
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
