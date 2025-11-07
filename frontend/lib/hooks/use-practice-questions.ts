"use client";

import { useQuery } from "@tanstack/react-query";

import practiceApi, { PracticeQuestionSummary } from "../practice-api";

export default function usePracticeQuestions() {
  return useQuery({
    queryKey: ["practice-questions"],
    queryFn: () => practiceApi.listQuestions().then((res) => res.data),
    onError: (err) => {
      // 便于定位“题目加载失败”的具体原因
      if (process.env.NODE_ENV !== "production") {
        // eslint-disable-next-line no-console
        console.error("加载题目列表失败:", err);
      }
    },
  });
}
