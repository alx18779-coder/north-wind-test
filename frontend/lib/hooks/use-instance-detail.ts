"use client";

import { useMutation, useQuery, useQueryClient } from "@tanstack/react-query";

import adminApi, { DatabaseInstance, InstanceUpdateRequest } from "../admin-api";

export default function useInstanceDetail(id: number) {
  const queryClient = useQueryClient();

  const detailQuery = useQuery({
    queryKey: ["instance", id],
    queryFn: () => adminApi.getInstance(id).then((res) => res.data),
    enabled: !!id,
  });

  const updateMutation = useMutation({
    mutationFn: (payload: InstanceUpdateRequest) => adminApi.updateInstance(id, payload).then((res) => res.data),
    onSuccess: (data: DatabaseInstance) => {
      queryClient.setQueryData(["instance", id], data);
      queryClient.invalidateQueries({ queryKey: ["instances"] });
    },
  });

  const deleteMutation = useMutation({
    mutationFn: () => adminApi.deleteInstance(id),
    onSuccess: () => {
      queryClient.invalidateQueries({ queryKey: ["instances"] });
    },
  });

  const testMutation = useMutation({
    mutationFn: () => adminApi.testInstance(id),
  });

  const initMutation = useMutation({
    mutationFn: () => adminApi.initInstance(id).then((res) => res.data),
  });

  return {
    detailQuery,
    updateMutation,
    deleteMutation,
    testMutation,
    initMutation,
  };
}
