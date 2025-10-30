"use client";

import { useEffect, useState } from "react";

import usePracticeQuestions from "../../lib/hooks/use-practice-questions";
import usePracticeQuestion from "../../lib/hooks/use-practice-question";
import QuestionDetail from "./question-detail";
import QuestionList from "./question-list";
import PracticeWorkspace from "./workspace";

export default function PracticeShell() {
  const questionsQuery = usePracticeQuestions();
  const [selectedQuestion, setSelectedQuestion] = useState<number | null>(null);
  const [selectedInstance, setSelectedInstance] = useState<string | null>(null);
  const questionDetailQuery = usePracticeQuestion(selectedQuestion);
  const questionDetail = questionDetailQuery.data;

  useEffect(() => {
    if (!selectedQuestion && questionsQuery.data && questionsQuery.data.length > 0) {
      setSelectedQuestion(questionsQuery.data[0].id);
    }
  }, [selectedQuestion, questionsQuery.data]);

  useEffect(() => {
    if (questionDetail && questionDetail.instance_tags.length > 0) {
      setSelectedInstance((prev) => prev ?? questionDetail.instance_tags[0]);
    }
  }, [questionDetail?.id]);
  const loadingInitial = questionsQuery.isLoading && !selectedQuestion;
  const noQuestions = !questionsQuery.isLoading && questionsQuery.data && questionsQuery.data.length === 0;

  return (
    <div className="mx-auto flex h-full w-full max-w-6xl flex-1 flex-col min-h-0 px-6 py-10">
      <div className="shrink-0">
        <h1 className="text-3xl font-bold text-slate-50">SQL 实战练习</h1>
        <p className="text-sm text-slate-400">选择题目、编写查询，对照北风数据集查看结果与性能统计。</p>
      </div>
      {noQuestions ? (
        <div className="mt-6 flex-1 min-h-0">
          <div className="h-full overflow-auto">
            <div className="rounded border border-slate-800 bg-slate-900 p-6 text-sm text-slate-400">
              暂无已发布的题目，稍后再来看看吧。
            </div>
          </div>
        </div>
      ) : (
        <div className="mt-6 flex-1 min-h-0">
          <div className="h-full min-h-0 overflow-auto">
            <div className="grid h-full min-h-0 gap-6 lg:grid-cols-[260px_1fr]">
              <QuestionList
                selectedId={selectedQuestion}
                onSelect={(id) => {
                  setSelectedQuestion(id);
                  setSelectedInstance(null);
                }}
                questions={questionsQuery.data}
                loading={questionsQuery.isLoading}
                error={Boolean(questionsQuery.error)}
              />
              <div className="flex h-full min-h-0 flex-col gap-6 overflow-hidden">
                <QuestionDetail
                  question={questionDetail}
                  loading={questionDetailQuery.isLoading || loadingInitial}
                  selectedInstance={selectedInstance}
                  onInstanceChange={setSelectedInstance}
                />
                <div className="flex flex-1 flex-col overflow-hidden min-h-0">
                  <PracticeWorkspace
                    question={questionDetail}
                    instanceTag={selectedInstance}
                    className="flex h-full flex-1 flex-col min-h-0"
                  />
                </div>
              </div>
            </div>
          </div>
        </div>
      )}
    </div>
  );
}
