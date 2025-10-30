import QuestionForm from "../../../../components/admin/questions/question-form";

export default function NewQuestionPage() {
  return (
    <div className="mx-auto flex max-w-4xl flex-col gap-6 px-6 py-10">
      <div>
        <h1 className="text-2xl font-semibold text-slate-50">Create Question</h1>
        <p className="text-sm text-slate-400">Craft a new SQL exercise for learners.</p>
      </div>
      <QuestionForm />
    </div>
  );
}
