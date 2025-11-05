"use client";

import { MouseEvent as ReactMouseEvent, useEffect, useRef, useState } from "react";
import { useQueryClient } from "@tanstack/react-query";

import useExecuteQuestion from "../../lib/hooks/use-execute-question";
import useToast from "../../lib/hooks/use-toast";
import { PracticeQuestionDetail } from "../../lib/practice-api";
import SqlEditor from "./sql-editor";

interface Props {
  question: PracticeQuestionDetail | undefined;
  instanceTag: string | null;
  className?: string;
}

export default function PracticeWorkspace({ question, instanceTag, className }: Props) {
  const queryClient = useQueryClient();
  const toast = useToast();
  const executeMutation = useExecuteQuestion();
  const [sql, setSql] = useState("");
  const [error, setError] = useState<string | null>(null);
  const result = executeMutation.data;
  const [columnWidths, setColumnWidths] = useState<Record<string, number>>({});
  const prevQuestionIdRef = useRef<number | undefined>(undefined);

  // 恢复/保存每道题的 SQL 草稿：
  // - 切换题目前保存上一题草稿
  // - 打开新题：若有草稿则恢复；否则在编辑器中注入题目信息的注释（题号/标题/期望字段/描述）
  useEffect(() => {
    const currentId = question?.id;
    const prevId = prevQuestionIdRef.current;
    // 保存上一题的草稿
    if (prevId) {
      try {
        localStorage.setItem(`practice-sql-${prevId}`, sql);
      } catch {}
    }
    // 切换到新题时尝试恢复本地草稿；若无草稿则保留现有 SQL（不清空）
    if (currentId && currentId !== prevId) {
      try {
        const saved = localStorage.getItem(`practice-sql-${currentId}`);
        if (saved && saved.length > 0) {
          setSql(saved);
        } else if (question) {
          const lines: string[] = [];
          lines.push(`-- 题号: ${question.question_id}  标题: ${question.title}`);
          if (question.required_fields) {
            lines.push(`-- 期望字段: ${question.required_fields}`);
          }
          if (question.description) {
            lines.push(`-- 描述:`);
            for (const l of question.description.split("\n")) {
              lines.push(`-- ${l}`);
            }
          }
          lines.push("");
          setSql(lines.join("\n"));
        }
      } catch {}
      setError(null);
      executeMutation.reset();
    }
    prevQuestionIdRef.current = currentId;
    // 仅在题目 id 变化时执行
    // eslint-disable-next-line react-hooks/exhaustive-deps
  }, [question?.id]);

  // 移除切题即覆盖 SQL 的行为

  useEffect(() => {
    if (!result) {
      setColumnWidths({});
      return;
    }
    setColumnWidths((prev) => {
      const next: Record<string, number> = {};
      let changed = false;
      for (const column of result.columns) {
        if (prev[column] !== undefined) {
          next[column] = prev[column];
        }
      }
      if (Object.keys(prev).length !== Object.keys(next).length) {
        changed = true;
      }
      return changed ? next : prev;
    });
  }, [result?.columns]);

  const handleResizeStart = (column: string, event: ReactMouseEvent<HTMLDivElement>) => {
    event.preventDefault();
    event.stopPropagation();
    const headerCell = event.currentTarget.parentElement as HTMLTableCellElement | null;
    if (!headerCell) {
      return;
    }
    const startX = event.clientX;
    const startWidth = headerCell.getBoundingClientRect().width;

    const handleMouseMove = (moveEvent: MouseEvent) => {
      const delta = moveEvent.clientX - startX;
      const newWidth = Math.max(80, startWidth + delta);
      setColumnWidths((prev) => ({ ...prev, [column]: newWidth }));
    };

    const handleMouseUp = () => {
      window.removeEventListener("mousemove", handleMouseMove);
      window.removeEventListener("mouseup", handleMouseUp);
    };

    window.addEventListener("mousemove", handleMouseMove);
    window.addEventListener("mouseup", handleMouseUp);
  };

  const handleRun = async () => {
    if (!question) {
      setError("请先选择题目");
      return;
    }
    const targetInstance = instanceTag ?? question.instance_tags[0] ?? "pg_default";
    setError(null);
    try {
      await executeMutation.mutateAsync({ questionId: question.id, sql, instanceTag: targetInstance });
      queryClient.invalidateQueries({ queryKey: ["practice-history"] });
      toast.showSuccess("查询完成");
    } catch (err: any) {
      setError(err?.response?.data?.detail ?? "执行失败");
      toast.showError("查询失败");
    }
  };

  const containerClassName = ["flex min-h-0 flex-col rounded border border-slate-800 bg-slate-900 p-6", className]
    .filter(Boolean)
    .join(" ");

  // 轻量 SQL 美化：不依赖外部库，尽量保持注释与字符串
  const formatSql = (input: string) => {
    const text = input ?? "";
    if (!text.trim()) return text;
    // 1) 提取字符串字面量，避免误处理
    const placeholders: string[] = [];
    let tmp = "";
    let i = 0;
    while (i < text.length) {
      const ch = text[i];
      if (ch === "'" || ch === '"') {
        const quote = ch;
        let j = i + 1;
        let buf = quote;
        while (j < text.length) {
          const c = text[j];
          buf += c;
          if (c === quote && text[j - 1] !== "\\") {
            j++;
            break;
          }
          j++;
        }
        const index = placeholders.push(buf) - 1;
        tmp += `__Q${index}__`;
        i = j;
        continue;
      }
      tmp += ch;
      i++;
    }
    // 2) 统一空白并大写关键字
    let s = tmp.replace(/[\t\r\n]+/g, " ").replace(/\s+/g, " ");
    const keywords = [
      "SELECT","FROM","WHERE","GROUP BY","ORDER BY","HAVING","LIMIT","OFFSET",
      "UNION ALL","UNION","INNER JOIN","LEFT JOIN","RIGHT JOIN","FULL JOIN","JOIN","ON"
    ];
    // 先匹配多词关键字
    keywords.sort((a,b)=>b.length-a.length).forEach(kw => {
      const re = new RegExp(`\\b${kw.replace(/ /g, "\\s+")}\\b`, "gi");
      s = s.replace(re, kw);
    });
    // 3) 在主要子句前换行
    s = s
      .replace(/\s+(UNION ALL|UNION)\b/g, "\n$1")
      .replace(/\s+(FROM|WHERE|GROUP BY|ORDER BY|HAVING|LIMIT|OFFSET)\b/g, "\n$1")
      .replace(/\s+((?:INNER|LEFT|RIGHT|FULL) JOIN|JOIN)\b/g, "\n$1")
      .replace(/\s+ON\b/g, "\n  ON");
    // 4) 逗号换行（影响 SELECT/GROUP BY/ORDER BY 列表，可能略显激进）
    s = s.replace(/,\s*/g, ",\n  ");
    // 5) 按括号缩进
    const lines = s.split(/\n/);
    let depth = 0;
    const out: string[] = [];
    for (const raw of lines) {
      const trimmed = raw.trim();
      const dec = (trimmed.match(/[)\]]/g) || []).length;
      const inc = (trimmed.match(/[(\[]/g) || []).length;
      // 在包含右括号的行先减少缩进
      const currentDepth = Math.max(0, depth - dec);
      out.push("  ".repeat(currentDepth) + trimmed);
      depth = Math.max(0, currentDepth + inc);
    }
    let result = out.join("\n");
    // 6) 还原字符串字面量
    result = result.replace(/__Q(\d+)__/g, (_, idx) => placeholders[Number(idx)] ?? "");
    return result.trim();
  };

  return (
    <section className={containerClassName}>
      <div className="mb-3 flex items-center justify-between">
        <h2 className="text-sm font-semibold text-slate-100">SQL 工作台</h2>
        <div className="flex items-center gap-2">
          <button
            onClick={() => setSql((prev) => formatSql(prev))}
            disabled={!question}
            className="rounded border border-slate-600 px-3 py-2 text-xs text-slate-200 hover:bg-slate-800 disabled:cursor-not-allowed"
            title="美化 SQL（试验性）"
          >
            美化 SQL
          </button>
          <button
            onClick={handleRun}
            disabled={executeMutation.isPending || !question}
            className="rounded bg-emerald-500 px-4 py-2 text-sm font-medium text-emerald-950 hover:bg-emerald-400 disabled:cursor-not-allowed"
          >
            {executeMutation.isPending ? "执行中..." : "执行查询"}
          </button>
        </div>
      </div>
      <SqlEditor value={sql} onChange={setSql} disabled={!question} />
      {error && <div className="mt-3 rounded border border-rose-700 bg-rose-950 px-3 py-2 text-xs text-rose-200">{error}</div>}
      {result && (
        <div className="mt-4 flex flex-1 flex-col overflow-hidden rounded border border-slate-800 bg-slate-900/60 min-h-0">
          <div className="flex items-center justify-between border-b border-slate-800 px-4 py-2 text-xs text-slate-400">
            <span>行数： {result.rows.length}</span>
            <span>耗时： {result.execution_time_ms} ms</span>
          </div>
          <div className="flex-1 overflow-x-auto overflow-y-auto p-4 min-h-0">
            <table className="min-w-max text-left text-xs text-slate-200">
              <thead className="bg-slate-800 text-slate-400">
                <tr>
                  {result.columns.map((column) => {
                    const customWidth = columnWidths[column];
                    const headerStyle = customWidth
                      ? { width: customWidth, minWidth: customWidth, maxWidth: customWidth }
                      : undefined;
                    return (
                      <th
                        key={column}
                        className="relative select-none px-4 py-2 text-left"
                        style={headerStyle}
                      >
                        <span className="pr-2 text-slate-200">{column}</span>
                        <div
                          role="separator"
                          aria-orientation="vertical"
                          onMouseDown={(event) => handleResizeStart(column, event)}
                          className="absolute right-0 top-0 h-full w-1 cursor-col-resize select-none bg-transparent"
                        />
                      </th>
                    );
                  })}
                </tr>
              </thead>
              <tbody>
                {result.rows.map((row, index) => (
                  <tr key={index} className="border-b border-slate-800/60">
                    {result.columns.map((column) => {
                    const customWidth = columnWidths[column];
                    const rawValue = row[column];
                    const displayValue = rawValue == null ? "" : String(rawValue);
                    const shouldTruncate = !customWidth && typeof rawValue === "string" && displayValue.length > 60;
                    const cellStyle = customWidth
                      ? { width: customWidth, minWidth: customWidth, maxWidth: customWidth }
                      : undefined;
                    const cellClass = [
                      "px-4 py-2 font-mono text-[11px] text-slate-300",
                      customWidth || shouldTruncate
                        ? "whitespace-nowrap overflow-hidden text-ellipsis"
                        : "whitespace-nowrap",
                      shouldTruncate ? "max-w-[28ch]" : undefined,
                    ]
                      .filter(Boolean)
                      .join(" ");
                    const title = customWidth || shouldTruncate ? displayValue : undefined;
                    return (
                      <td key={column} className={cellClass} style={cellStyle} title={title}>
                        {displayValue}
                      </td>
                    );
                  })}
                  </tr>
                ))}
              </tbody>
            </table>
          </div>
          {result.truncated && (
            <div className="border-t border-amber-500/30 bg-amber-900/20 px-4 py-2 text-[11px] text-amber-200">
              结果已截断至最大行数限制。
            </div>
          )}
        </div>
      )}
    </section>
  );
}
