import fs from "node:fs/promises";
import path from "node:path";

export async function GET() {
  const cwd = process.cwd();
  const candidates = [
    // 构建时常用工作目录推导
    path.resolve(cwd, "../infrastructure/sql/northwind_pg.sql"),
    // 明确的容器内绝对路径（runner 镜像拷贝位置）
    "/app/infrastructure/sql/northwind_pg.sql",
    // 兜底：若拷贝到 public/sql 下也可供下载
    path.resolve(cwd, "public/sql/northwind_pg.sql"),
  ];
  for (const p of candidates) {
    try {
      const buf = await fs.readFile(p);
      return new Response(buf, {
        status: 200,
        headers: {
          "content-type": "text/plain; charset=utf-8",
          "content-disposition": "attachment; filename=\"northwind_pg.sql\"",
          "cache-control": "no-store",
        },
      });
    } catch {}
  }
  return new Response("DDL file not found", { status: 404 });
}
