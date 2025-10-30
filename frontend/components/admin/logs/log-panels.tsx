"use client";

import { useQuery } from "@tanstack/react-query";

import adminApi from "../../../lib/admin-api";

const executionStatusMap: Record<string, string> = {
  success: "成功",
  error: "失败",
  timeout: "超时",
};

const fetchExecutionLogs = async () => {
  const response = await adminApi.listExecutionLogs();
  return response.data;
};

const fetchAuditLogs = async () => {
  const response = await adminApi.listAuditLogs();
  return response.data;
};

export default function LogPanels() {
  const executionQuery = useQuery({ queryKey: ["execution-logs"], queryFn: fetchExecutionLogs });
  const auditQuery = useQuery({ queryKey: ["audit-logs"], queryFn: fetchAuditLogs });

  return (
    <div className="grid gap-6 lg:grid-cols-2">
      <section className="rounded border border-slate-800 bg-slate-900">
        <div className="border-b border-slate-800 px-4 py-3 text-sm font-semibold text-slate-100">执行日志</div>
        <div className="max-h-80 overflow-y-auto px-4 py-3 text-xs text-slate-300">
          {executionQuery.isLoading && <div className="text-slate-400">正在加载执行日志...</div>}
          {executionQuery.error && <div className="text-rose-300">执行日志加载失败。</div>}
          <ul className="space-y-2">
            {executionQuery.data?.map((log) => (
              <li key={log.id} className="rounded border border-slate-800 px-3 py-2">
                <div className="flex items-center justify-between text-slate-200">
                  <span>{log.instance_tag}</span>
                  <span>{new Date(log.created_at).toLocaleString()}</span>
                </div>
                <div className="mt-1 text-slate-400">
                  状态：<span className="font-mono text-slate-200">{executionStatusMap[log.status] ?? log.status}</span>
                  {log.execution_time_ms != null && ` • ${log.execution_time_ms} ms`}
                </div>
              </li>
            ))}
          </ul>
        </div>
      </section>

      <section className="rounded border border-slate-800 bg-slate-900">
        <div className="border-b border-slate-800 px-4 py-3 text-sm font-semibold text-slate-100">操作审计日志</div>
        <div className="max-h-80 overflow-y-auto px-4 py-3 text-xs text-slate-300">
          {auditQuery.isLoading && <div className="text-slate-400">正在加载审计日志...</div>}
          {auditQuery.error && <div className="text-rose-300">审计日志加载失败。</div>}
          <ul className="space-y-2">
            {auditQuery.data?.map((log) => (
              <li key={log.id} className="rounded border border-slate-800 px-3 py-2">
                <div className="flex items-center justify-between text-slate-200">
                  <span>{log.action}</span>
                  <span>{new Date(log.created_at).toLocaleString()}</span>
                </div>
                <div className="mt-1 text-slate-400">
                  {log.success ? "成功" : "失败"}
                  {log.target_type && ` • 目标类型：${log.target_type}`}
                  {log.target_id && ` (${log.target_id})`}
                </div>
              </li>
            ))}
          </ul>
        </div>
      </section>
    </div>
  );
}
