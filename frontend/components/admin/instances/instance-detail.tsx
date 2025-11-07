"use client";

import { useRouter } from "next/navigation";
import { useEffect, useState } from "react";

import adminApi from "../../../lib/admin-api";
import useToast from "../../../lib/hooks/use-toast";
import useInstanceDetail from "../../../lib/hooks/use-instance-detail";
import useInstanceInitJobs from "../../../lib/hooks/use-instance-init-jobs";
import type { DbInitJob } from "../../../lib/admin-api";

interface Props {
  instanceId: number;
}

export default function InstanceDetail({ instanceId }: Props) {
  const router = useRouter();
  const toast = useToast();
  const { detailQuery, updateMutation, deleteMutation, testMutation, initMutation } = useInstanceDetail(instanceId);
  const initJobsQuery = useInstanceInitJobs(instanceId);
  const [notes, setNotes] = useState<string>("");
  const [password, setPassword] = useState<string | null>(null);
  const [isDecrypting, setIsDecrypting] = useState(false);

  useEffect(() => {
    if (detailQuery.data) {
      setNotes(detailQuery.data.notes ?? "");
    }
  }, [detailQuery.data]);

  useEffect(() => {
    if (testMutation.isSuccess) {
      toast.showSuccess("连接测试成功");
    }
    if (testMutation.isError) {
      toast.showError("连接测试失败");
    }
  }, [testMutation.isSuccess, testMutation.isError]);

  useEffect(() => {
    if (initMutation.isSuccess) {
      toast.showSuccess("初始化任务已排队");
    }
    if (initMutation.isError) {
      toast.showError("初始化任务失败");
    }
  }, [initMutation.isSuccess, initMutation.isError]);

  // 避免在 hooks 声明之后再出现早退 return，
  // 统一在渲染时根据状态选择内容，以防开发模式下出现 Hooks 次序不一致。
  const isLoading = detailQuery.isLoading;
  const hasError = detailQuery.isError || !detailQuery.data;
  const instance = detailQuery.data;
  const isBusy = updateMutation.isPending || deleteMutation.isPending || testMutation.isPending || initMutation.isPending;

  const handleSave = async () => {
    await updateMutation.mutateAsync({ notes });
    toast.showSuccess("备注已保存");
  };

  const handleDelete = async () => {
    await deleteMutation.mutateAsync();
    toast.showInfo("实例已删除");
    router.push("/admin/instances");
  };

  const handleDecrypt = async () => {
    setIsDecrypting(true);
    try {
      const response = await adminApi.decryptPassword(instanceId);
      setPassword(response.data);
    } finally {
      setIsDecrypting(false);
    }
  };

  const refreshJobs = () => initJobsQuery.refetch();

  const handleInit = async () => {
    try {
      await initMutation.mutateAsync();
      toast.showSuccess("已提交初始化任务");
    } catch (err) {
      toast.showError("初始化任务提交失败");
    }
    refreshJobs();
  };

  // React Query 的类型在构建环境下可能推断为 `never[] | NonNullable<TQueryFnData>`，
  // 这里显式断言为 DbInitJob[] 以消除联合类型造成的编译错误。
  const jobs = (initJobsQuery.data ?? []) as DbInitJob[];
  // 使用数字数组跟踪展开记录，避免非可序列化状态(Set/Map)
  const defaultExpandedIds: number[] = [];
  const [expandedIds, setExpandedIds] = useState(defaultExpandedIds);
  const toggleExpand = (id: number) => {
    setExpandedIds((prev) => (prev.includes(id) ? prev.filter((x) => x !== id) : [...prev, id]));
  };
  const copyText = async (text?: string | null) => {
    const value = typeof text === "string" ? text : "";
    if (!value) {
      toast.showInfo("无可复制内容");
      return;
    }
    try {
      await navigator.clipboard.writeText(value);
      toast.showSuccess("已复制到剪贴板");
    } catch {
      toast.showError("复制失败");
    }
  };
  const activeJob = jobs.find((job) => job.status === "queued" || job.status === "running");
  const jobStatusMap: Record<string, string> = {
    queued: "排队中",
    running: "运行中",
    success: "成功",
    failed: "失败",
    cancelled: "已取消",
  };

  let mainContent: JSX.Element | null = null;
  if (isLoading) {
    mainContent = <div className="text-sm text-slate-400">正在加载实例...</div>;
  } else if (hasError || !instance) {
    mainContent = <div className="text-sm text-rose-300">未找到该实例。</div>;
  } else {
    mainContent = (
      <>
      <section className="rounded border border-slate-800 bg-slate-900 p-4">
        <h2 className="text-sm font-semibold text-slate-100">连接信息</h2>
        <dl className="mt-3 grid grid-cols-1 gap-3 text-xs text-slate-300 md:grid-cols-2">
          <div>
            <dt className="text-slate-500">名称</dt>
            <dd>{instance.name}</dd>
          </div>
          <div>
            <dt className="text-slate-500">引擎</dt>
            <dd>{instance.engine}</dd>
          </div>
          <div>
            <dt className="text-slate-500">主机</dt>
            <dd>
              {instance.host}:{instance.port}
            </dd>
          </div>
          <div>
            <dt className="text-slate-500">数据库</dt>
            <dd>{instance.database}</dd>
          </div>
          <div className="space-y-2">
            <dt className="text-slate-500">用户名</dt>
            <dd>{instance.username}</dd>
            <button
              onClick={handleDecrypt}
              className="rounded border border-slate-700 px-3 py-1 text-xs text-slate-200 hover:bg-slate-800"
            >
              {isDecrypting ? "正在解密..." : "显示密码"}
            </button>
            {password && <div className="font-mono text-xs text-emerald-300">{password}</div>}
          </div>
          <div>
            <dt className="text-slate-500">状态</dt>
            <dd>{instance.status}</dd>
          </div>
          <div>
            <dt className="text-slate-500">标签</dt>
            <dd>{instance.tags.length > 0 ? instance.tags.join(", ") : "--"}</dd>
          </div>
        </dl>
      </section>

      <section className="rounded border border-slate-800 bg-slate-900 p-4">
        <h2 className="text-sm font-semibold text-slate-100">操作</h2>
        <div className="mt-3 flex flex-wrap gap-3 text-sm">
          <button
            onClick={() => testMutation.mutate()}
            disabled={isBusy}
            className="rounded border border-slate-600 px-4 py-2 text-slate-200 hover:bg-slate-800 disabled:cursor-not-allowed"
          >
            {testMutation.isPending ? "测试中..." : "测试连接"}
          </button>
          <button
            onClick={handleInit}
            disabled={isBusy || Boolean(activeJob)}
            className="rounded border border-emerald-600 px-4 py-2 text-emerald-200 hover:bg-emerald-600/20 disabled:cursor-not-allowed"
          >
            {initMutation.isPending || activeJob ? "初始化中..." : "执行初始化"}
          </button>
          <button
            onClick={handleDelete}
            disabled={isBusy}
            className="rounded border border-rose-600 px-4 py-2 text-rose-200 hover:bg-rose-900/30 disabled:cursor-not-allowed"
          >
            删除实例
          </button>
        </div>
        {testMutation.isSuccess && !testMutation.isPending && (
          <div className="mt-3 rounded border border-emerald-700 bg-emerald-950 px-3 py-2 text-xs text-emerald-200">
            连接成功。
          </div>
        )}
        {testMutation.isError && (
          <div className="mt-3 rounded border border-rose-700 bg-rose-950 px-3 py-2 text-xs text-rose-200">
            连接失败。
          </div>
        )}
        <div className="mt-5">
          <div className="text-xs font-semibold uppercase tracking-wide text-slate-400">初始化记录</div>
          {initJobsQuery.isLoading && <div className="text-xs text-slate-500">正在加载记录...</div>}
          {jobs.length === 0 && !initJobsQuery.isLoading && (
            <div className="text-xs text-slate-500">暂无初始化记录。</div>
          )}
          <ul className="mt-2 space-y-2">
            {jobs.map((job) => (
              <li key={job.id} className="rounded border border-slate-800 px-3 py-2 text-xs text-slate-300">
                <div className="flex items-center justify-between text-slate-200">
                  <span>{jobStatusMap[job.status] ?? job.status}</span>
                  <span>{new Date(job.created_at).toLocaleString()}</span>
                </div>
                {job.log && (
                  <div className="mt-1 text-slate-400">
                    {(() => {
                      const isLong = job.log.length > 800;
                      const isOpen = expandedIds.includes(job.id);
                      const display = isLong && !isOpen ? job.log.slice(0, 800) + "\n…(已截断，点击展开查看全部)" : job.log;
                      return (
                        <div>
                          <pre className="max-h-60 overflow-auto whitespace-pre-wrap break-words rounded border border-slate-800 bg-slate-950 p-2 text-[11px] text-slate-300">
                            {display}
                          </pre>
                          <div className="mt-1 flex gap-2">
                            {isLong && (
                              <button
                                onClick={() => toggleExpand(job.id)}
                                className="rounded border border-slate-700 px-2 py-1 text-[11px] text-slate-200 hover:bg-slate-800"
                              >
                                {isOpen ? "收起" : "展开"}
                              </button>
                            )}
                            <button
                              onClick={() => copyText(job.log)}
                              className="rounded border border-slate-700 px-2 py-1 text-[11px] text-slate-200 hover:bg-slate-800"
                            >
                              复制全部
                            </button>
                          </div>
                        </div>
                      );
                    })()}
                  </div>
                )}
              </li>
            ))}
          </ul>
          {activeJob && (
            <div className="mt-2 text-xs text-slate-400">初始化任务进行中...</div>
          )}
        </div>
      </section>

      <section className="rounded border border-slate-800 bg-slate-900 p-4">
        <h2 className="text-sm font-semibold text-slate-100">备注</h2>
        <textarea
          value={notes}
          onChange={(event) => setNotes(event.target.value)}
          className="mt-2 min-h-[120px] w-full rounded border border-slate-700 bg-slate-950 px-3 py-2 text-sm text-slate-200"
        />
        <div className="mt-3 flex gap-3">
          <button
            onClick={handleSave}
            disabled={updateMutation.isPending}
            className="rounded border border-slate-600 px-4 py-2 text-slate-200 hover:bg-slate-800 disabled:cursor-not-allowed"
          >
            {updateMutation.isPending ? "保存中..." : "保存备注"}
          </button>
        </div>
      </section>
      </>
    );
  }

  return <div className="space-y-6">{mainContent}</div>;
}
