import QuestionImport from "../../../../components/admin/questions/question-import";

export default function QuestionImportPage() {
  return (
    <div className="mx-auto flex max-w-4xl flex-col gap-6 px-6 py-10">
      <div>
        <h1 className="text-2xl font-semibold text-slate-50">Import Question Bank</h1>
        <p className="text-sm text-slate-400">Upload a JSON file containing question definitions.</p>
      </div>
      <QuestionImport />
    </div>
  );
}
