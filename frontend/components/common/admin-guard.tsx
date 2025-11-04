"use client";

import useAuthStore from "../../lib/stores/auth-store";
import LoginForm from "../admin/login-form";

export default function AdminGuard({ children }: { children: React.ReactNode }) {
  const { token, expiresAt } = useAuthStore();

  const isExpired = !!expiresAt && Date.now() > expiresAt;
  if (!token || isExpired) {
    return (
      <div className="mx-auto flex max-w-md flex-col gap-6 px-6 py-16">
        <h1 className="text-2xl font-semibold text-slate-50">管理员登录</h1>
        <LoginForm />
      </div>
    );
  }

  return <>{children}</>;
}
