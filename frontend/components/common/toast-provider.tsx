"use client";

import { ReactNode } from "react";

import useToastStore from "../../lib/stores/toast-store";

export default function ToastProvider({ children }: { children: ReactNode }) {
  const { toasts, removeToast } = useToastStore((state) => ({
    toasts: state.toasts,
    removeToast: state.removeToast,
  }));

  return (
    <>
      {children}
      <div className="pointer-events-none fixed bottom-4 right-4 z-50 flex flex-col gap-3">
        {toasts.map((toast) => (
          <div
            key={toast.id}
            className={`pointer-events-auto min-w-[220px] rounded border px-4 py-3 text-sm shadow-lg ${
              toast.type === "success"
                ? "border-emerald-600 bg-emerald-950 text-emerald-200"
                : toast.type === "error"
                ? "border-rose-700 bg-rose-950 text-rose-200"
                : "border-slate-600 bg-slate-900 text-slate-200"
            }`}
            onClick={() => removeToast(toast.id)}
          >
            {toast.message}
          </div>
        ))}
      </div>
    </>
  );
}
