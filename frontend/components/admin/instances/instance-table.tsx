"use client";

import Link from "next/link";

import adminApi from "../../../lib/admin-api";
import useInstanceList from "../../../lib/hooks/use-instance-list";

export default function InstanceTable() {
  const { data, isLoading, error } = useInstanceList();

  return (
    <div className="rounded-md border border-slate-800 bg-slate-900">
      <div className="flex items-center justify-between border-b border-slate-800 px-4 py-3">
        <h2 className="text-sm font-semibold text-slate-100">数据库实例</h2>
        <Link
          href="/admin/instances/new"
          className="rounded border border-emerald-600 px-3 py-1 text-xs text-emerald-200 hover:bg-emerald-600/20"
        >
          新增实例
        </Link>
      </div>
      <div className="px-4 py-4 text-sm text-slate-300">
        {isLoading && <div className="text-xs text-slate-400">正在加载实例...</div>}
        {error && <div className="text-xs text-rose-300">实例加载失败</div>}
        {!isLoading && data && data.length === 0 && <div className="text-xs text-slate-400">暂无实例。</div>}
        <div className="space-y-3">
          {data?.map((instance) => (
            <div key={instance.id} className="flex items-center justify-between rounded border border-slate-800 px-4 py-3">
              <div>
                <div className="text-sm font-medium text-slate-100">{instance.name}</div>
                <div className="text-xs text-slate-400">
                  {instance.engine.toUpperCase()} • {instance.host}:{instance.port} • 超时 {instance.timeout_seconds}s
                </div>
                {instance.tags.length > 0 && (
                  <div className="mt-1 text-[11px] text-emerald-300">
                    标签：{instance.tags.join(", ")}
                  </div>
                )}
              </div>
              <Link
                href={`/admin/instances/${instance.id}`}
                className="rounded border border-slate-700 px-3 py-1 text-xs text-slate-200 hover:bg-slate-800"
              >
                管理
              </Link>
            </div>
          ))}
        </div>
      </div>
    </div>
  );
}
