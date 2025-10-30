"use client";

import { FormEvent, useEffect, useState } from "react";

import adminApi from "../../../lib/admin-api";
import useSettings, { AppSettings } from "../../../lib/hooks/use-settings";
import useToast from "../../../lib/hooks/use-toast";
import useAuthStore from "../../../lib/stores/auth-store";

export default function SettingsPanel() {
  const { settingsQuery, updateMutation } = useSettings();
  const [form, setForm] = useState<AppSettings | null>(null);
  const [message, setMessage] = useState<string | null>(null);
  const toast = useToast();
  const clearAuth = useAuthStore((state) => state.clear);

  const [passwordForm, setPasswordForm] = useState({
    username: "admin",
    currentPassword: "",
    newPassword: "",
    confirmPassword: "",
  });
  const [passwordMessage, setPasswordMessage] = useState<string | null>(null);
  const [passwordError, setPasswordError] = useState<string | null>(null);
  const [isChangingPassword, setIsChangingPassword] = useState(false);

  useEffect(() => {
    if (settingsQuery.data) {
      setForm(settingsQuery.data);
    }
  }, [settingsQuery.data]);

  if (settingsQuery.isLoading || !form) {
    return <div className="text-sm text-slate-400">正在加载配置...</div>;
  }

  const handleChange = (key: keyof AppSettings) => (event: React.ChangeEvent<HTMLInputElement>) => {
    const value = Number(event.target.value);
    setForm((prev) => (prev ? { ...prev, [key]: value } : prev));
  };

  const handleSubmit = async (event: React.FormEvent) => {
    event.preventDefault();
    if (!form) return;
    setMessage(null);
    await updateMutation.mutateAsync(form);
    setMessage("配置已保存");
  };

  const handlePasswordFieldChange = (field: "username" | "currentPassword" | "newPassword" | "confirmPassword") =>
    (event: React.ChangeEvent<HTMLInputElement>) => {
      setPasswordForm((prev) => ({ ...prev, [field]: event.target.value }));
    };

  const handlePasswordSubmit = async (event: FormEvent) => {
    event.preventDefault();
    setPasswordMessage(null);
    setPasswordError(null);

    if (!passwordForm.username.trim() || !passwordForm.currentPassword || !passwordForm.newPassword) {
      setPasswordError("请完整填写所有字段");
      return;
    }
    if (passwordForm.newPassword !== passwordForm.confirmPassword) {
      setPasswordError("两次输入的新密码不一致");
      return;
    }

    setIsChangingPassword(true);
    try {
      await adminApi.changePassword({
        username: passwordForm.username.trim(),
        current_password: passwordForm.currentPassword,
        new_password: passwordForm.newPassword,
      });
      setPasswordMessage("密码已更新，请使用新密码重新登录。");
      toast.showSuccess("密码修改成功");
      clearAuth();
      setPasswordForm((prev) => ({ ...prev, currentPassword: "", newPassword: "", confirmPassword: "" }));
    } catch (error: any) {
      const detail = error?.response?.data?.detail ?? "修改密码失败";
      setPasswordError(detail);
      toast.showError(detail);
    } finally {
      setIsChangingPassword(false);
    }
  };

  return (
    <div className="space-y-6">
      <form onSubmit={handleSubmit} className="rounded border border-slate-800 bg-slate-900 p-6 text-sm text-slate-200">
        <h2 className="text-lg font-semibold text-slate-50">执行与平台配置</h2>
        <p className="text-xs text-slate-400">设置 SQL 执行限制及平台保留策略的默认值。</p>

        <div className="mt-4 grid grid-cols-1 gap-4 md:grid-cols-2">
          <label className="flex flex-col gap-1 text-xs uppercase text-slate-400">
            超时时间（秒）
            <input
              type="number"
              min={1}
              value={form.default_timeout_seconds}
              onChange={handleChange("default_timeout_seconds")}
              className="rounded border border-slate-700 bg-slate-900 px-3 py-2 text-slate-100"
            />
          </label>
          <label className="flex flex-col gap-1 text-xs uppercase text-slate-400">
            最大返回行数
            <input
              type="number"
              min={1}
              value={form.default_max_rows}
              onChange={handleChange("default_max_rows")}
              className="rounded border border-slate-700 bg-slate-900 px-3 py-2 text-slate-100"
            />
          </label>
          <label className="flex flex-col gap-1 text-xs uppercase text-slate-400">
            最大并发数
            <input
              type="number"
              min={1}
              value={form.default_concurrency_limit}
              onChange={handleChange("default_concurrency_limit")}
              className="rounded border border-slate-700 bg-slate-900 px-3 py-2 text-slate-100"
            />
          </label>
          <label className="flex flex-col gap-1 text-xs uppercase text-slate-400">
            每分钟请求限额
            <input
              type="number"
              min={1}
              value={form.rate_limit_per_minute}
              onChange={handleChange("rate_limit_per_minute")}
              className="rounded border border-slate-700 bg-slate-900 px-3 py-2 text-slate-100"
            />
          </label>
          <label className="flex flex-col gap-1 text-xs uppercase text-slate-400">
            日志保留天数
            <input
              type="number"
              min={1}
              value={form.log_retention_days}
              onChange={handleChange("log_retention_days")}
              className="rounded border border-slate-700 bg-slate-900 px-3 py-2 text-slate-100"
            />
          </label>
        </div>

        {message && <div className="mt-4 rounded border border-emerald-700 bg-emerald-950 px-3 py-2 text-xs text-emerald-200">{message}</div>}

        <div className="mt-4 flex gap-3">
          <button
            type="submit"
            disabled={updateMutation.isPending}
            className="rounded bg-emerald-500 px-4 py-2 text-sm font-medium text-emerald-950 hover:bg-emerald-400 disabled:cursor-not-allowed"
          >
            {updateMutation.isPending ? "保存中..." : "保存配置"}
          </button>
        </div>
      </form>

      <section className="rounded border border-slate-800 bg-slate-900 p-6 text-sm text-slate-200">
        <h2 className="text-lg font-semibold text-slate-50">修改管理员密码</h2>
        <p className="text-xs text-slate-400">默认管理员初始密码为 <code>admin</code>，请及时更新为强密码。</p>

        <form className="mt-4 space-y-3" onSubmit={handlePasswordSubmit}>
          <label className="flex flex-col gap-1 text-xs uppercase text-slate-400">
            用户名
            <input
              value={passwordForm.username}
              onChange={handlePasswordFieldChange("username")}
              className="rounded border border-slate-700 bg-slate-900 px-3 py-2 text-slate-100"
            />
          </label>
          <label className="flex flex-col gap-1 text-xs uppercase text-slate-400">
            当前密码
            <input
              type="password"
              value={passwordForm.currentPassword}
              onChange={handlePasswordFieldChange("currentPassword")}
              className="rounded border border-slate-700 bg-slate-900 px-3 py-2 text-slate-100"
            />
          </label>
          <label className="flex flex-col gap-1 text-xs uppercase text-slate-400">
            新密码
            <input
              type="password"
              value={passwordForm.newPassword}
              onChange={handlePasswordFieldChange("newPassword")}
              className="rounded border border-slate-700 bg-slate-900 px-3 py-2 text-slate-100"
            />
          </label>
          <label className="flex flex-col gap-1 text-xs uppercase text-slate-400">
            确认新密码
            <input
              type="password"
              value={passwordForm.confirmPassword}
              onChange={handlePasswordFieldChange("confirmPassword")}
              className="rounded border border-slate-700 bg-slate-900 px-3 py-2 text-slate-100"
            />
          </label>

          {passwordError && (
            <div className="rounded border border-rose-700 bg-rose-950 px-3 py-2 text-xs text-rose-200">{passwordError}</div>
          )}
          {passwordMessage && (
            <div className="rounded border border-emerald-700 bg-emerald-950 px-3 py-2 text-xs text-emerald-200">{passwordMessage}</div>
          )}

          <div className="flex gap-3">
            <button
              type="submit"
              disabled={isChangingPassword}
              className="rounded bg-emerald-500 px-4 py-2 text-sm font-medium text-emerald-950 hover:bg-emerald-400 disabled:cursor-not-allowed"
            >
              {isChangingPassword ? "提交中..." : "更新密码"}
            </button>
          </div>
        </form>
      </section>
    </div>
  );
}
