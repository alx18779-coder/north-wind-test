import QuestionTable from "../../../components/admin/questions/question-table";

export default function QuestionsPage() {
  return (
    <div className="mx-auto flex max-w-6xl flex-col gap-6 px-6 py-10">
      <div>
        <h1 className="text-2xl font-semibold text-slate-50">Question Bank</h1>
        <p className="text-sm text-slate-400">Manage curated SQL exercises for learners.</p>
      </div>
      <QuestionTable />
    </div>
  );
}
