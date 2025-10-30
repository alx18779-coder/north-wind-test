"use client";

import { useQuery } from "@tanstack/react-query";

import practiceApi, { PracticeQuestionDetail } from "../practice-api";

export default function usePracticeQuestion(id: number | null) {
  return useQuery({
    queryKey: ["practice-question", id],
    queryFn: () => practiceApi.getQuestion(id as number).then((res) => res.data),
    enabled: id !== null,
  });
}
