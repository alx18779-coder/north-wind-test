import fs from "node:fs/promises";
import path from "node:path";

export async function GET() {
  try {
    const root = process.cwd();
    const ddlPath = path.resolve(root, "../infrastructure/sql/northwind_mysql.sql");
    const buf = await fs.readFile(ddlPath);
    return new Response(buf, {
      status: 200,
      headers: {
        "content-type": "text/plain; charset=utf-8",
        "content-disposition": "attachment; filename=\"northwind_mysql.sql\"",
        "cache-control": "no-store",
      },
    });
  } catch (err) {
    return new Response("DDL file not found", { status: 404 });
  }
}

