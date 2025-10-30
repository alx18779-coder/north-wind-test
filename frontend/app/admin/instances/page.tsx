import InstanceTable from "../../../components/admin/instances/instance-table";

export default function InstancesPage() {
  return (
    <div className="mx-auto flex max-w-6xl flex-col gap-6 px-6 py-10">
      <div>
        <h1 className="text-2xl font-semibold text-slate-50">Database Instances</h1>
        <p className="text-sm text-slate-400">Manage connections to Northwind databases across engines.</p>
      </div>
      <InstanceTable />
    </div>
  );
}
