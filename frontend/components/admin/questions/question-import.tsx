"use client";

import { useMemo, useState } from "react";

import adminApi, { QuestionCreateRequest } from "../../../lib/admin-api";
import useToast from "../../../lib/hooks/use-toast";

type FileKind = "json" | "csv";

function toArray(input?: string | null): string[] {
  if (!input) return [];
  // 支持分号优先，其次逗号；并去除空白
  const parts = input
    .split(/[;，,]/)
    .map((s) => s.trim())
    .filter(Boolean);
  // 也允许 JSON 数组形式
  if (parts.length === 1 && parts[0].startsWith("[") && parts[0].endsWith("]")) {
    try {
      const parsed = JSON.parse(parts[0]);
      if (Array.isArray(parsed)) return parsed.map((x) => String(x));
    } catch (_) {
      // ignore
    }
  }
  return parts;
}

// 轻量 CSV 解析（支持带引号与换行的字段，双引号转义为两个双引号）
function parseCsv(text: string): Array<Record<string, string>> {
  const rows: string[][] = [];
  let row: string[] = [];
  let field = "";
  let inQuotes = false;
  for (let i = 0; i < text.length; i++) {
    const c = text[i];
    const next = text[i + 1];
    if (inQuotes) {
      if (c === '"' && next === '"') {
        field += '"';
        i++; // skip escaped quote
      } else if (c === '"') {
        inQuotes = false;
      } else {
        field += c;
      }
    } else {
      if (c === '"') {
        inQuotes = true;
      } else if (c === ',') {
        row.push(field);
        field = "";
      } else if (c === '\n') {
        row.push(field);
        rows.push(row);
        row = [];
        field = "";
      } else if (c === '\r') {
        // normalize CRLF -> treat on next char if \n
      } else {
        field += c;
      }
    }
  }
  // last field
  row.push(field);
  rows.push(row);

  // header + records
  const header = rows.shift() || [];
  return rows
    .filter((r) => r.some((v) => v && v.trim().length > 0))
    .map((r) => {
      const obj: Record<string, string> = {};
      header.forEach((h, idx) => {
        obj[h.trim()] = (r[idx] ?? "").trim();
      });
      return obj;
    });
}

export default function QuestionImport() {
  const [fileName, setFileName] = useState<string>("");
  const [isUploading, setIsUploading] = useState(false);
  const [message, setMessage] = useState<string | null>(null);
  const [error, setError] = useState<string | null>(null);
  const [kind, setKind] = useState<FileKind | null>(null);
  const [validateResult, setValidateResult] = useState<
    | { ok: boolean; errors: Array<{ index: number; field: string; message: string }>; stats: { rows: number; valid: number; invalid: number } }
    | null
  >(null);
  const toast = useToast();

  const handleFileChange = async (event: React.ChangeEvent<HTMLInputElement>) => {
    const file = event.target.files?.[0];
    if (!file) return;
    setFileName(file.name);
    const lower = file.name.toLowerCase();
    const detected: FileKind = lower.endsWith(".csv") || file.type.includes("csv") ? "csv" : "json";
    setKind(detected);
    setIsUploading(true);
    setMessage(null);
    setError(null);
    try {
      const text = await file.text();
      let payload: QuestionCreateRequest[] = [];
      if (detected === "json") {
        payload = JSON.parse(text) as QuestionCreateRequest[];
      } else {
        const records = parseCsv(text);
        payload = records.map((r, idx) => {
          const refs: Array<{ engine: string; sql_text: string }> = [];
          if (r.reference_sql_pg) refs.push({ engine: "postgres", sql_text: r.reference_sql_pg });
          if (r.reference_sql_mysql) refs.push({ engine: "mysql", sql_text: r.reference_sql_mysql });
          const hintsArr = toArray(r.hints).map((h, i) => ({ display_order: i + 1, content: h }));
          const instanceTags = toArray(r.instance_tags);
          const item: QuestionCreateRequest = {
            question_id: r.question_id,
            title: r.title,
            description: r.description,
            required_fields: r.required_fields,
            difficulty: r.difficulty,
            category: r.category,
            status: r.status,
            instance_tags: instanceTags,
            notes: r.notes || undefined,
            reference_sql: refs,
            hints: hintsArr,
          };
          // 简单必填校验，缺失时报错行号
          const required = [
            "question_id",
            "title",
            "description",
            "required_fields",
            "difficulty",
            "category",
            "status",
          ] as const;
          for (const key of required) {
            if (!item[key] || String(item[key]).trim() === "") {
              throw new Error(`CSV 第 ${idx + 2} 行缺少必填字段: ${key}`);
            }
          }
          return item;
        });
      }
      // 若已经有校验结果且未通过，阻止直接导入
      if (validateResult && !validateResult.ok) {
        throw new Error("校验未通过，请先修复错误或重新校验");
      }
      const response = await adminApi.importQuestions(payload);
      setMessage(`导入成功 ${response.data.success_count} 条，失败 ${response.data.failure_count} 条`);
      toast.showSuccess("导入完成");
      if (response.data.report?.failures?.length) {
        setError(JSON.stringify(response.data.report.failures, null, 2));
      }
    } catch (err: any) {
      setError(err?.message ?? "导入失败");
      toast.showError("题目导入失败");
    } finally {
      setIsUploading(false);
    }
  };

  const handleValidate = async () => {
    setIsUploading(true);
    setMessage(null);
    setError(null);
    try {
      const input = document.querySelector<HTMLInputElement>('input[type="file"]');
      const file = input?.files?.[0];
      if (!file) throw new Error("请先选择文件");
      const text = await file.text();
      const lower = file.name.toLowerCase();
      const detected: FileKind = lower.endsWith(".csv") || file.type.includes("csv") ? "csv" : "json";
      let payload: QuestionCreateRequest[] = [];
      if (detected === "json") {
        payload = JSON.parse(text) as QuestionCreateRequest[];
      } else {
        const records = parseCsv(text);
        payload = records.map((r) => {
          const refs: Array<{ engine: string; sql_text: string }> = [];
          if (r.reference_sql_pg) refs.push({ engine: "postgres", sql_text: r.reference_sql_pg });
          if (r.reference_sql_mysql) refs.push({ engine: "mysql", sql_text: r.reference_sql_mysql });
          const hintsArr = toArray(r.hints).map((h, i) => ({ display_order: i + 1, content: h }));
          const instanceTags = toArray(r.instance_tags);
          return {
            question_id: r.question_id,
            title: r.title,
            description: r.description,
            required_fields: r.required_fields,
            difficulty: r.difficulty,
            category: r.category,
            status: r.status,
            instance_tags: instanceTags,
            notes: r.notes || undefined,
            reference_sql: refs,
            hints: hintsArr,
          } as QuestionCreateRequest;
        });
      }
      const resp = await adminApi.validateQuestions(payload);
      setValidateResult(resp.data);
      if (resp.data.ok) toast.showSuccess("校验通过，可导入");
      else toast.showError("校验未通过，请查看错误列表");
    } catch (err: any) {
      setError(err?.message ?? "校验失败");
      setValidateResult(null);
    } finally {
      setIsUploading(false);
    }
  };

  const handleDownloadJsonTemplate = () => {
    const template: QuestionCreateRequest = {
      question_id: "Q001",
      title: "示例题目",
      description: "请描述练习内容",
      required_fields: "字段1, 字段2",
      difficulty: "beginner",
      category: "聚合",
      status: "draft",
      instance_tags: ["pg_default"],
      notes: "可填写备注信息",
      reference_sql: [
        { engine: "postgres", sql_text: "SELECT * FROM customers;" },
      ],
      hints: [
        { display_order: 1, content: "从 SELECT 开始" },
      ],
    };
    const blob = new Blob([JSON.stringify([template], null, 2)], { type: "application/json" });
    const url = URL.createObjectURL(blob);
    const link = document.createElement("a");
    link.href = url;
    link.download = "question-template.json";
    link.click();
    URL.revokeObjectURL(url);
  };

  const handleDownloadCsvTemplate = () => {
    const header = [
      "question_id",
      "title",
      "description",
      "required_fields",
      "difficulty",
      "category",
      "reference_sql_pg",
      "reference_sql_mysql",
      "instance_tags",
      "hints",
      "status",
      "notes",
    ];
    const sample = [
      "Q001",
      "Top Suppliers",
      '列出所有提供了4种以上不同商品的供应商。',
      'SupplierID, CompanyName, ProductCount',
      'intermediate',
      'aggregation',
      'SELECT ...',
      'SELECT ...',
      'pg_default;mysql_default',
      '多表 JOIN;使用 COUNT DISTINCT',
      'published',
      '首批上线题目',
    ];
    const escape = (v: string) =>
      /[",\n]/.test(v) ? '"' + v.replaceAll('"', '""') + '"' : v;
    const csv = [header.join(","), sample.map(escape).join(",")].join("\n");
    const blob = new Blob([csv], { type: "text/csv;charset=utf-8" });
    const url = URL.createObjectURL(blob);
    const link = document.createElement("a");
    link.href = url;
    link.download = "question-template.csv";
    link.click();
    URL.revokeObjectURL(url);
  };

  return (
    <div className="rounded border border-slate-800 bg-slate-900 p-6 text-sm text-slate-200">
      <div className="flex items-center justify-between">
        <div>
          <h2 className="text-lg font-semibold text-slate-50">批量导入题目</h2>
          <p className="text-xs text-slate-400">上传符合模版结构的 JSON 或 CSV 文件（多值建议用分号分隔）。</p>
        </div>
        <div className="flex gap-2">
          <button
            onClick={handleDownloadJsonTemplate}
            className="rounded border border-slate-600 px-3 py-1 text-xs text-slate-200 hover:bg-slate-800"
          >
            下载JSON模版
          </button>
          <button
            onClick={handleDownloadCsvTemplate}
            className="rounded border border-slate-600 px-3 py-1 text-xs text-slate-200 hover:bg-slate-800"
          >
            下载CSV模版
          </button>
        </div>
      </div>

      <div className="mt-4 flex flex-col gap-3">
        <input type="file" accept="application/json,text/csv,.csv" onChange={handleFileChange} disabled={isUploading} />
        <div className="flex gap-2">
          <button
            onClick={handleValidate}
            disabled={isUploading}
            className="rounded border border-slate-600 px-3 py-1 text-xs text-slate-200 hover:bg-slate-800 disabled:cursor-not-allowed"
          >
            校验并预览
          </button>
        </div>
        {fileName && (
          <div className="text-xs text-slate-400">已选择文件：{fileName}{kind ? `（${kind.toUpperCase()}）` : ""}</div>
        )}
        {isUploading && <div className="text-xs text-slate-400">正在导入...</div>}
        {message && <div className="rounded border border-emerald-700 bg-emerald-950 px-3 py-2 text-xs text-emerald-200">{message}</div>}
        {error && (
          <pre className="overflow-x-auto rounded border border-rose-700 bg-rose-950 px-3 py-2 text-xs text-rose-200">
            {error}
          </pre>
        )}
        {validateResult && (
          <div className="mt-2 rounded border border-slate-800 bg-slate-900/60 p-3 text-xs">
            <div className="mb-2 text-slate-300">
              校验结果：{validateResult.ok ? "通过" : "未通过"}，总行 {validateResult.stats.rows}，有效 {validateResult.stats.valid}，无效 {validateResult.stats.invalid}
            </div>
            {!validateResult.ok && (
              <div className="max-h-60 overflow-auto rounded border border-slate-800 bg-slate-950 p-2 text-slate-200">
                <table className="min-w-full text-left">
                  <thead>
                    <tr className="text-slate-400">
                      <th className="px-2 py-1">行号</th>
                      <th className="px-2 py-1">字段</th>
                      <th className="px-2 py-1">错误</th>
                    </tr>
                  </thead>
                  <tbody>
                    {validateResult.errors.map((e, i) => (
                      <tr key={i} className="border-t border-slate-800">
                        <td className="px-2 py-1">{e.index + 1}</td>
                        <td className="px-2 py-1">{e.field}</td>
                        <td className="px-2 py-1">{e.message}</td>
                      </tr>
                    ))}
                  </tbody>
                </table>
              </div>
            )}
          </div>
        )}
      </div>
    </div>
  );
}
