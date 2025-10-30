"use client";

import { useMutation } from "@tanstack/react-query";

import practiceApi, { ExecuteQuestionPayload, ExecuteQuestionResult } from "../practice-api";

export default function useExecuteQuestion() {
  return useMutation({
    mutationFn: (payload: ExecuteQuestionPayload) => practiceApi.executeQuestion(payload).then((res) => res.data.data),
  });
}
