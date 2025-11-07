"use client";

import { useQuery } from "@tanstack/react-query";

import adminApi, { DbInitJob } from "../admin-api";

export default function useInstanceInitJobs(id: number) {
  return useQuery<DbInitJob[]>({
    queryKey: ["instance-init-jobs", id],
    queryFn: () => adminApi.listInitJobs(id).then((res) => res.data),
    enabled: !!id,
    // 按 TanStack Query v5 签名：传入的是 Query 对象，而不是 data 本身
    refetchInterval: (query) => {
      const data = query.state.data as DbInitJob[] | undefined;
      const jobs = Array.isArray(data) ? data : [];
      if (jobs.length === 0) return false;
      const running = jobs.some((job) => job.status === "queued" || job.status === "running");
      return running ? 3000 : false;
    },
  });
}
