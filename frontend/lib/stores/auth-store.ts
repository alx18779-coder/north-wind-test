"use client";

import { create } from "zustand";

interface AuthState {
  token: string | null;
  expiresAt: number | null;
  setAuth: (token: string, expiresInSeconds: number) => void;
  clear: () => void;
  hydrateFromStorage: () => void;
}

const storageKey = "nw_admin_token";
const storageExpiryKey = "nw_admin_token_expiry";

const readStoredAuth = (): Pick<AuthState, "token" | "expiresAt"> => {
  const token = localStorage.getItem(storageKey);
  const expiresRaw = localStorage.getItem(storageExpiryKey);
  const expiresAt = expiresRaw ? Number(expiresRaw) : null;
  if (token && expiresAt && Date.now() < expiresAt) {
    return { token, expiresAt };
  }
  localStorage.removeItem(storageKey);
  localStorage.removeItem(storageExpiryKey);
  return { token: null, expiresAt: null };
};

const useAuthStore = create<AuthState>((set) => ({
  token: null,
  expiresAt: null,
  setAuth: (token: string, expiresInSeconds: number) => {
    const expiresAt = Date.now() + expiresInSeconds * 1000;
    if (typeof window !== "undefined") {
      localStorage.setItem(storageKey, token);
      localStorage.setItem(storageExpiryKey, expiresAt.toString());
    }
    set({ token, expiresAt });
  },
  clear: () => {
    if (typeof window !== "undefined") {
      localStorage.removeItem(storageKey);
      localStorage.removeItem(storageExpiryKey);
    }
    set({ token: null, expiresAt: null });
  },
  hydrateFromStorage: () => {
    if (typeof window === "undefined") {
      return;
    }
    const nextState = readStoredAuth();
    set(nextState);
  },
}));

export default useAuthStore;
