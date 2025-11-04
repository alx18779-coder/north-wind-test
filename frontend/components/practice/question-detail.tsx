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
  const [open, setOpen] = useState(false);
  useEffect(() => {
    setReferenceSql(null);
    setOpen(false);
  }, [question?.id, selectedInstance]);
  if (loading) {
    return <div className="rounded border border-slate-800 bg-slate-900 p-6 text-sm text-slate-400">正在加载题目...</div>;
  }

  if (!question) {
    return <div className="rounded border border-slate-800 bg-slate-900 p-6 text-sm text-slate-400">请选择题目开始练习。</div>;
  }

  const fallbackInstance = question.instance_tags[0] ?? "pg_default";
  const activeInstance = selectedInstance ?? fallbackInstance;

  const fetchReference = async () => {
    try {
      const sql = await referenceMutation.mutateAsync({ questionId: question.id, instanceTag: activeInstance });
      setReferenceSql(sql);
      return sql;
    } catch (err: any) {
      toast.showError("无法获取参考答案");
      throw err;
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
        <div className="rounded border border-slate-800 bg-slate-900/40">
          <button
            className="flex w-full items-center justify-between px-3 py-2 text-left text-xs text-slate-300 hover:bg-slate-800/50"
            onClick={async () => {
              if (open) {
                setOpen(false);
                return;
              }
              if (referenceSql) {
                setOpen(true);
              } else if (!referenceMutation.isPending) {
                try {
                  await fetchReference();
                  setOpen(true);
                } catch {
                  // error already toasted
                }
              }
            }}
          >
            <span className="inline-flex items-center gap-2">
              <span
                className={
                  "inline-block h-0 w-0 border-l-4 border-t-4 border-b-4 border-l-slate-300 border-t-transparent border-b-transparent transition-transform " +
                  (open ? "rotate-90" : "rotate-0")
                }
                aria-hidden
              />
              参考答案
            </span>
            {referenceMutation.isPending && <span className="text-slate-500">（加载中...）</span>}
          </button>
          {open && referenceSql && (
            <pre className="m-3 overflow-x-auto rounded border border-slate-800 bg-slate-950 p-3 text-xs text-slate-200">
              {referenceSql}
            </pre>
          )}
        </div>
      </section>
    </div>
  );
}
