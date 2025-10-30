import InstanceForm from "../../../../components/admin/instances/instance-form";

export default function NewInstancePage() {
  return (
    <div className="mx-auto flex max-w-3xl flex-col gap-6 px-6 py-10">
      <div>
        <h1 className="text-2xl font-semibold text-slate-50">Add Database Instance</h1>
        <p className="text-sm text-slate-400">Provide connection details for a Northwind database.</p>
      </div>
      <InstanceForm />
    </div>
  );
}
