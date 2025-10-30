"use client";

import { create } from "zustand";

export type ToastType = "info" | "success" | "error";

export interface ToastMessage {
  id: number;
  type: ToastType;
  message: string;
}

interface ToastState {
  toasts: ToastMessage[];
  addToast: (type: ToastType, message: string, duration?: number) => void;
  removeToast: (id: number) => void;
}

let counter = 0;

const useToastStore = create<ToastState>((set, get) => ({
  toasts: [],
  addToast: (type, message, duration = 4000) => {
    const id = ++counter;
    set((state) => ({ toasts: [...state.toasts, { id, type, message }] }));
    if (duration > 0) {
      setTimeout(() => get().removeToast(id), duration);
    }
  },
  removeToast: (id) => set((state) => ({ toasts: state.toasts.filter((toast) => toast.id != id) })),
}));

export default useToastStore;
