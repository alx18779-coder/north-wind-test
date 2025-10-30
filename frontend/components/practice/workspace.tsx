"use client";

import { MouseEvent as ReactMouseEvent, useEffect, useState } from "react";
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
  const [sql, setSql] = useState("SELECT * FROM customers LIMIT 10;");
  const [error, setError] = useState<string | null>(null);
  const result = executeMutation.data;
  const [columnWidths, setColumnWidths] = useState<Record<string, number>>({});

  useEffect(() => {
    if (question) {
      setSql(`-- ${question.title}\n`);
      setError(null);
      executeMutation.reset();
    }
  }, [question?.id]);

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

  return (
    <section className={containerClassName}>
      <div className="mb-3 flex items-center justify-between">
        <h2 className="text-sm font-semibold text-slate-100">SQL 工作台</h2>
        <button
          onClick={handleRun}
          disabled={executeMutation.isPending || !question}
          className="rounded bg-emerald-500 px-4 py-2 text-sm font-medium text-emerald-950 hover:bg-emerald-400 disabled:cursor-not-allowed"
        >
          {executeMutation.isPending ? "执行中..." : "执行查询"}
        </button>
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
