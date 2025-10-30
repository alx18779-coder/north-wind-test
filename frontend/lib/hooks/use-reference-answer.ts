"use client";

import { useMutation } from "@tanstack/react-query";

import practiceApi from "../practice-api";

export default function useReferenceAnswer() {
  return useMutation({
    mutationFn: ({ questionId, instanceTag }: { questionId: number; instanceTag: string }) =>
      practiceApi.getReference(questionId, instanceTag).then((res) => res.data.sql),
  });
}
