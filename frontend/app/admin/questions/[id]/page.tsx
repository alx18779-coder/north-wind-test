import { notFound } from "next/navigation";

import QuestionEditShell from "../../../../components/admin/questions/question-edit-shell";

interface Props {
  params: { id: string };
}

export default function QuestionDetailPage({ params }: Props) {
  const questionId = Number(params.id);
  if (Number.isNaN(questionId)) {
    notFound();
  }

  return <QuestionEditShell questionId={questionId} />;
}
