"use client";

import { useMutation, useQuery, useQueryClient } from "@tanstack/react-query";

import httpClient from "../http-client";

export interface AppSettings {
  default_timeout_seconds: number;
  default_max_rows: number;
  default_concurrency_limit: number;
  rate_limit_per_minute: number;
  log_retention_days: number;
}

const fetchSettings = async (): Promise<AppSettings> => {
  const response = await httpClient.get<AppSettings>("/admin/settings/");
  return response.data;
};

export default function useSettings() {
  const queryClient = useQueryClient();

  const settingsQuery = useQuery({ queryKey: ["settings"], queryFn: fetchSettings });

  const updateMutation = useMutation({
    mutationFn: (payload: Partial<AppSettings>) => httpClient.patch<AppSettings>("/admin/settings/", payload).then((res) => res.data),
    onSuccess: (data) => {
      queryClient.setQueryData(["settings"], data);
    },
  });

  return { settingsQuery, updateMutation };
}
