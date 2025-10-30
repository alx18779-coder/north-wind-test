"use client";

import { useQuery } from "@tanstack/react-query";

import adminApi, { DbInitJob } from "../admin-api";

export default function useInstanceInitJobs(id: number) {
  return useQuery<DbInitJob[]>({
    queryKey: ["instance-init-jobs", id],
    queryFn: () => adminApi.listInitJobs(id).then((res) => res.data),
    enabled: !!id,
    refetchInterval: (data: DbInitJob[] | undefined) => {
      const jobs = Array.isArray(data) ? data : [];
      if (jobs.length === 0) return false;
      const running = jobs.some((job) => job.status === "queued" || job.status === "running");
      return running ? 3000 : false;
    },
  });
}
