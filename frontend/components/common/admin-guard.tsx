"use client";

import { useEffect } from "react";
import { useRouter } from "next/navigation";

import useAuthStore from "../../lib/stores/auth-store";

export default function AdminGuard({ children }: { children: React.ReactNode }) {
  const { token, expiresAt } = useAuthStore();
  const router = useRouter();

  useEffect(() => {
    if (!token || (expiresAt && Date.now() > expiresAt)) {
      router.replace("/login");
    }
  }, [token, expiresAt, router]);

  if (!token) {
    return null;
  }

  return <>{children}</>;
}
