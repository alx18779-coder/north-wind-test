"use client";

import useToastStore, { ToastType } from "../stores/toast-store";

export default function useToast() {
  const addToast = useToastStore((state) => state.addToast);
  return {
    showSuccess: (message: string) => addToast("success", message),
    showError: (message: string) => addToast("error", message),
    showInfo: (message: string) => addToast("info", message),
  };
}
