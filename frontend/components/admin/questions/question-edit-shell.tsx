"use client";

import { useRouter } from "next/navigation";

import useQuestionDetail from "../../../lib/hooks/use-question-detail";
import useToast from "../../../lib/hooks/use-toast";
import QuestionForm from "./question-form";

interface Props {
  questionId: number;
}

export default function QuestionEditShell({ questionId }: Props) {
  const router = useRouter();
  const { detailQuery, deleteMutation } = useQuestionDetail(questionId);
  const toast = useToast();

  if (detailQuery.isLoading) {
    return <div className="px-6 py-10 text-sm text-slate-400">题目信息加载中...</div>;
  }

  if (!detailQuery.data) {
    return <div className="px-6 py-10 text-sm text-rose-300">未找到对应题目。</div>;
  }

  const handleDelete = async () => {
    await deleteMutation.mutateAsync();
    toast.showInfo("题目已删除");
    router.push("/admin/questions");
  };

  return (
    <div className="mx-auto flex max-w-4xl flex-col gap-6 px-6 py-10">
      <div className="flex items-center justify-between">
        <div>
          <h1 className="text-2xl font-semibold text-slate-50">编辑题目</h1>
          <p className="text-sm text-slate-400">更新题面描述与参考答案。</p>
        </div>
        <button
          onClick={handleDelete}
          className="rounded border border-rose-600 px-4 py-2 text-sm text-rose-200 hover:bg-rose-900/30"
        >
          删除
        </button>
      </div>
      <QuestionForm initialQuestion={detailQuery.data} />
    </div>
  );
}
