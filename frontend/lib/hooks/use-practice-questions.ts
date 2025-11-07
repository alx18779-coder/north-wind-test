"use client";

import { useQuery } from "@tanstack/react-query";

import practiceApi, { PracticeQuestionSummary } from "../practice-api";

export default function usePracticeQuestions() {
  return useQuery({
    queryKey: ["practice-questions"],
    queryFn: () => practiceApi.listQuestions().then((res) => res.data),
  });
}
