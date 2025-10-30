"use client";

import Link from "next/link";

import useInstanceList from "../../lib/hooks/use-instance-list";

export default function AdminDashboard() {
  const { data, isLoading, error } = useInstanceList();

  return (
    <div className="mx-auto flex max-w-5xl flex-col gap-6 px-6 py-10">
      <header>
        <h1 className="text-2xl font-semibold text-slate-50">管理概览</h1>
        <p className="text-sm text-slate-400">配置数据库实例、维护题库，并查看执行情况。</p>
      </header>

      <section className="rounded-md border border-slate-800 bg-slate-900">
        <div className="border-b border-slate-800 px-4 py-3 text-sm font-semibold text-slate-200">数据库实例</div>
        <div className="flex flex-col gap-2 px-4 py-4">
          {isLoading && <span className="text-xs text-slate-400">正在加载实例...</span>}
          {error && <span className="text-xs text-rose-300">实例加载失败</span>}
          {data?.map((instance) => (
            <div key={instance.id} className="flex items-center justify-between rounded-md border border-slate-800 px-4 py-3">
              <div>
                <h3 className="text-sm font-medium text-slate-100">{instance.name}</h3>
                <p className="text-xs text-slate-400">
                  {instance.engine.toUpperCase()} • {instance.host}:{instance.port} • 超时 {instance.timeout_seconds}s
                </p>
              </div>
              <Link
                href={`/admin/instances/${instance.id}`}
                className="rounded-md border border-slate-700 px-3 py-1 text-xs text-slate-200 hover:bg-slate-800"
              >
                查看
              </Link>
            </div>
          ))}
          {data && data.length === 0 && <span className="text-xs text-slate-400">暂无实例。</span>}
        </div>
      </section>

      <section className="rounded-md border border-slate-800 bg-slate-900">
        <div className="border-b border-slate-800 px-4 py-3 text-sm font-semibold text-slate-200">快捷操作</div>
        <div className="grid gap-3 px-4 py-4 md:grid-cols-3">
          {[
            { title: "新增数据库实例", href: "/admin/instances/new" },
            { title: "导入题库", href: "/admin/questions/import" },
            { title: "查看执行日志", href: "/admin/logs" },
            { title: "系统设置", href: "/admin/settings" },
          ].map((action) => (
            <Link
              key={action.title}
              href={action.href}
              className="rounded-md border border-slate-800 bg-slate-900 px-4 py-3 text-sm text-slate-200 hover:border-slate-600 hover:bg-slate-800"
            >
              {action.title}
            </Link>
          ))}
        </div>
      </section>
    </div>
  );
}
