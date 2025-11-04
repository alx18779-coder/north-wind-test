"use client";

import Link from "next/link";
import { usePathname, useRouter } from "next/navigation";
import { useEffect, useState } from "react";

import useAuthStore from "../../lib/stores/auth-store";

const adminLinks = [
  { href: "/admin", label: "管理概览" },
  { href: "/admin/questions", label: "题库" },
  { href: "/admin/logs", label: "日志" },
  { href: "/admin/settings", label: "设置" },
];

export default function AppHeader() {
  const pathname = usePathname();
  const router = useRouter();
  const token = useAuthStore((state) => state.token);
  const clear = useAuthStore((state) => state.clear);
  const hydrateFromStorage = useAuthStore((state) => state.hydrateFromStorage);
  const [hydrated, setHydrated] = useState(false);

  useEffect(() => {
    const result = hydrateFromStorage();
    Promise.resolve(result).finally(() => setHydrated(true));
  }, [hydrateFromStorage]);

  const handleLogout = () => {
    clear();
    router.push("/login");
  };

  const isAdminArea = pathname?.startsWith("/admin");

  return (
    <header className="border-b border-slate-800 bg-slate-900/60 backdrop-blur">
      <div className="mx-auto flex max-w-6xl items-center justify-between px-6 py-4">
        <Link href="/" className="text-lg font-semibold tracking-wide text-slate-50">
          北风 SQL 练习平台
        </Link>
        <nav className="flex items-center gap-4 text-sm text-slate-300">
          {(isAdminArea ? adminLinks : [{ href: "/practice", label: "练习" }]).map((link) => {
            const isActive = pathname?.startsWith(link.href);
            return (
              <Link
                key={link.href}
                href={link.href}
                className={
                  "rounded px-3 py-1 transition-colors" +
                  (isActive ? " bg-slate-800 text-slate-100" : " hover:bg-slate-800/60")
                }
              >
                {link.label}
              </Link>
            );
          })}
          {isAdminArea && (
            !hydrated ? (
              <span className="h-8 w-16 rounded bg-slate-800/40" aria-hidden="true" />
            ) : token ? (
              <button
                onClick={handleLogout}
                className="rounded border border-slate-700 px-3 py-1 text-xs text-slate-200 hover:bg-slate-800"
              >
                退出
              </button>
            ) : (
              <Link
                href="/admin"
                className="rounded border border-emerald-600 px-3 py-1 text-xs text-emerald-200 hover:bg-emerald-600/20"
              >
                登录
              </Link>
            )
          )}
        </nav>
      </div>
    </header>
  );
}
