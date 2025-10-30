"use client";

import { useRouter } from "next/navigation";
import { useState } from "react";

import adminApi, { InstanceCreateRequest } from "../../../lib/admin-api";
import useToast from "../../../lib/hooks/use-toast";

const defaultValues: InstanceCreateRequest = {
  name: "",
  engine: "postgres",
  host: "localhost",
  port: 5432,
  database: "northwind",
  username: "readonly",
  password: "",
  timeout_seconds: 6,
  max_rows: 1000,
  max_concurrency: 5,
  rate_limit_per_minute: 30,
  tags: ["pg_default"],
  notes: "",
};

export default function InstanceForm() {
  const router = useRouter();
  const toast = useToast();
  const [form, setForm] = useState(defaultValues);
  const [isSubmitting, setIsSubmitting] = useState(false);
  const [error, setError] = useState<string | null>(null);

  const handleChange = (field: keyof InstanceCreateRequest) => (event: React.ChangeEvent<HTMLInputElement | HTMLTextAreaElement | HTMLSelectElement>) => {
    const value = field === "tags" ? event.target.value.split(",").map((tag) => tag.trim()) : event.target.value;
    setForm((prev) => ({ ...prev, [field]: value }));
  };

  const handleSubmit = async (event: React.FormEvent) => {
    event.preventDefault();
    setIsSubmitting(true);
    setError(null);
    try {
      await adminApi.createInstance({ ...form, port: Number(form.port) });
      toast.showSuccess("实例创建成功");
      router.push("/admin/instances");
    } catch (err: any) {
      setError(err?.response?.data?.detail ?? "创建实例失败");
      toast.showError("创建实例失败");
    } finally {
      setIsSubmitting(false);
    }
  };

  return (
    <form onSubmit={handleSubmit} className="space-y-4">
      <div className="grid grid-cols-1 gap-4 md:grid-cols-2">
        <label className="flex flex-col gap-1 text-sm">
          <span className="text-xs uppercase text-slate-400">实例名称</span>
          <input
            required
            value={form.name}
            onChange={handleChange("name")}
            className="rounded border border-slate-700 bg-slate-900 px-3 py-2 text-slate-100"
          />
        </label>
        <label className="flex flex-col gap-1 text-sm">
          <span className="text-xs uppercase text-slate-400">数据库类型</span>
          <select
            value={form.engine}
            onChange={handleChange("engine")}
            className="rounded border border-slate-700 bg-slate-900 px-3 py-2 text-slate-100"
          >
            <option value="postgres">PostgreSQL</option>
            <option value="mysql">MySQL</option>
          </select>
        </label>
        <label className="flex flex-col gap-1 text-sm">
          <span className="text-xs uppercase text-slate-400">主机</span>
          <input
            required
            value={form.host}
            onChange={handleChange("host")}
            className="rounded border border-slate-700 bg-slate-900 px-3 py-2 text-slate-100"
          />
        </label>
        <label className="flex flex-col gap-1 text-sm">
          <span className="text-xs uppercase text-slate-400">端口</span>
          <input
            type="number"
            required
            value={form.port}
            onChange={handleChange("port")}
            className="rounded border border-slate-700 bg-slate-900 px-3 py-2 text-slate-100"
          />
        </label>
        <label className="flex flex-col gap-1 text-sm">
          <span className="text-xs uppercase text-slate-400">数据库名称</span>
          <input
            required
            value={form.database}
            onChange={handleChange("database")}
            className="rounded border border-slate-700 bg-slate-900 px-3 py-2 text-slate-100"
          />
        </label>
        <label className="flex flex-col gap-1 text-sm">
          <span className="text-xs uppercase text-slate-400">用户名</span>
          <input
            required
            value={form.username}
            onChange={handleChange("username")}
            className="rounded border border-slate-700 bg-slate-900 px-3 py-2 text-slate-100"
          />
        </label>
        <label className="flex flex-col gap-1 text-sm">
          <span className="text-xs uppercase text-slate-400">密码</span>
          <input
            required
            type="password"
            value={form.password}
            onChange={handleChange("password")}
            className="rounded border border-slate-700 bg-slate-900 px-3 py-2 text-slate-100"
          />
        </label>
        <label className="flex flex-col gap-1 text-sm">
          <span className="text-xs uppercase text-slate-400">标签（以逗号分隔）</span>
          <input
            value={form.tags.join(", ")}
            onChange={handleChange("tags")}
            className="rounded border border-slate-700 bg-slate-900 px-3 py-2 text-slate-100"
          />
        </label>
      </div>

      <label className="flex flex-col gap-1 text-sm">
        <span className="text-xs uppercase text-slate-400">备注</span>
        <textarea
          value={form.notes ?? ""}
          onChange={handleChange("notes")}
          className="min-h-[120px] rounded border border-slate-700 bg-slate-900 px-3 py-2 text-slate-100"
        />
      </label>

      {error && <div className="rounded border border-rose-700 bg-rose-950 px-3 py-2 text-xs text-rose-200">{error}</div>}

      <div className="flex gap-3">
        <button
          type="submit"
          disabled={isSubmitting}
          className="rounded bg-emerald-500 px-4 py-2 text-sm font-medium text-emerald-950 hover:bg-emerald-400 disabled:cursor-not-allowed"
        >
          {isSubmitting ? "创建中..." : "创建实例"}
        </button>
        <button
          type="button"
          onClick={() => router.back()}
          className="rounded border border-slate-600 px-4 py-2 text-sm text-slate-200 hover:bg-slate-800"
        >
          取消
        </button>
      </div>
    </form>
  );
}
