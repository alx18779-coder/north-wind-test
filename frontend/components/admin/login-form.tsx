"use client";

import { useState } from "react";
import { useRouter } from "next/navigation";

import authApi from "../../lib/auth-api";
import useAuthStore from "../../lib/stores/auth-store";
import useToast from "../../lib/hooks/use-toast";

export default function LoginForm() {
  const [username, setUsername] = useState("admin");
  const [password, setPassword] = useState("");
  const [isSubmitting, setIsSubmitting] = useState(false);
  const [error, setError] = useState<string | null>(null);
  const router = useRouter();
  const { setAuth } = useAuthStore();
  const toast = useToast();

  const handleSubmit = async (event: React.FormEvent) => {
    event.preventDefault();
    setIsSubmitting(true);
    setError(null);
    try {
      const response = await authApi.login({ username, password });
      setAuth(response.data.access_token, response.data.expires_in);
      toast.showSuccess("登录成功");
      router.push("/admin");
    } catch (err: any) {
      setError(err?.response?.data?.detail ?? "登录失败");
      toast.showError("登录失败");
    } finally {
      setIsSubmitting(false);
    }
  };

  return (
    <form onSubmit={handleSubmit} className="flex flex-col gap-4">
      <div className="flex flex-col gap-2">
        <label className="text-xs uppercase tracking-wide text-slate-400">用户名</label>
        <input
          value={username}
          onChange={(event) => setUsername(event.target.value)}
          className="rounded-md border border-slate-700 bg-slate-900 px-3 py-2 text-sm text-slate-100"
          autoComplete="username"
        />
      </div>
      <div className="flex flex-col gap-2">
        <label className="text-xs uppercase tracking-wide text-slate-400">密码</label>
        <input
          type="password"
          value={password}
          onChange={(event) => setPassword(event.target.value)}
          className="rounded-md border border-slate-700 bg-slate-900 px-3 py-2 text-sm text-slate-100"
          autoComplete="current-password"
        />
      </div>
      {error && <div className="rounded-md border border-rose-700 bg-rose-950 px-3 py-2 text-xs text-rose-200">{error}</div>}
      <button
        type="submit"
        disabled={isSubmitting}
        className="rounded-md bg-emerald-500 px-4 py-2 text-sm font-medium text-emerald-950 hover:bg-emerald-400 disabled:cursor-not-allowed disabled:bg-emerald-700"
      >
        {isSubmitting ? "登录中..." : "登录"}
      </button>
    </form>
  );
}
