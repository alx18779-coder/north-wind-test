"use client";

import { useMutation, useQuery, useQueryClient } from "@tanstack/react-query";

import adminApi, { QuestionCreateRequest, QuestionDetail, QuestionUpdateRequest } from "../admin-api";

export default function useQuestionDetail(id: number) {
  const queryClient = useQueryClient();

  const detailQuery = useQuery({
    queryKey: ["question", id],
    queryFn: () => adminApi.getQuestion(id).then((res) => res.data),
    enabled: !!id,
  });

  const updateMutation = useMutation({
    mutationFn: (payload: QuestionUpdateRequest) => adminApi.updateQuestion(id, payload).then((res) => res.data),
    onSuccess: (data: QuestionDetail) => {
      queryClient.setQueryData(["question", id], data);
      queryClient.invalidateQueries({ queryKey: ["questions"] });
    },
  });

  const deleteMutation = useMutation({
    mutationFn: () => adminApi.deleteQuestion(id),
    onSuccess: () => {
      queryClient.invalidateQueries({ queryKey: ["questions"] });
    },
  });

  return { detailQuery, updateMutation, deleteMutation };
}
