"use client";

import { useEffect, useState } from "react";

import { PracticeQuestionDetail } from "../../lib/practice-api";
import useReferenceAnswer from "../../lib/hooks/use-reference-answer";
import useToast from "../../lib/hooks/use-toast";

interface Props {
  question: PracticeQuestionDetail | undefined;
  loading: boolean;
  selectedInstance: string | null;
}

export default function QuestionDetail({ question, loading, selectedInstance }: Props) {
  const toast = useToast();
  const referenceMutation = useReferenceAnswer();
  const [referenceSql, setReferenceSql] = useState<string | null>(null);
  useEffect(() => {
    setReferenceSql(null);
  }, [question?.id, selectedInstance]);
  if (loading) {
    return <div className="rounded border border-slate-800 bg-slate-900 p-6 text-sm text-slate-400">正在加载题目...</div>;
  }

  if (!question) {
    return <div className="rounded border border-slate-800 bg-slate-900 p-6 text-sm text-slate-400">请选择题目开始练习。</div>;
  }

  const fallbackInstance = question.instance_tags[0] ?? "pg_default";
  const activeInstance = selectedInstance ?? fallbackInstance;

  const handleReference = async () => {
    try {
      const sql = await referenceMutation.mutateAsync({ questionId: question.id, instanceTag: activeInstance });
      setReferenceSql(sql);
    } catch (err: any) {
      toast.showError("无法获取参考答案");
    }
  };

  return (
    <div className="rounded border border-slate-800 bg-slate-900 p-6 text-sm text-slate-200">
      <header className="space-y-1 border-b border-slate-800 pb-3">
        <div className="text-xs uppercase tracking-wide text-slate-500">{question.question_id}</div>
        <h2 className="text-xl font-semibold text-slate-50">{question.title}</h2>
        <div className="text-xs text-slate-400">
          {question.difficulty} • {question.category}
        </div>
      </header>
      <section className="mt-4 space-y-4">
        {question.hints.length > 0 && (
          <div>
            <h3 className="text-xs uppercase text-slate-400">提示</h3>
            <ol className="mt-1 list-decimal space-y-1 pl-5 text-sm text-slate-300">
              {question.hints.map((hint, index) => (
                <li key={index}>{hint}</li>
              ))}
            </ol>
          </div>
        )}
        {question.notes && (
          <div>
            <h3 className="text-xs uppercase text-slate-400">备注</h3>
            <p className="mt-1 text-sm text-slate-300">{question.notes}</p>
          </div>
        )}
        <div>
          <h3 className="text-xs uppercase text-slate-400">参考答案</h3>
          <button
            onClick={handleReference}
            disabled={referenceMutation.isPending}
            className="mt-2 rounded border border-slate-700 px-3 py-1 text-xs text-slate-200 hover:bg-slate-800 disabled:cursor-not-allowed"
          >
            {referenceMutation.isPending ? "加载中..." : referenceSql ? "重新获取" : "查看参考答案"}
          </button>
          {referenceSql && (
            <pre className="mt-2 overflow-x-auto rounded border border-slate-800 bg-slate-950 p-3 text-xs text-slate-200">
              {referenceSql}
            </pre>
          )}
        </div>
      </section>
    </div>
  );
}
