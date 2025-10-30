import LogPanels from "../../../components/admin/logs/log-panels";

export default function LogsPage() {
  return (
    <div className="mx-auto flex max-w-6xl flex-col gap-6 px-6 py-10">
      <div>
        <h1 className="text-2xl font-semibold text-slate-50">Activity Logs</h1>
        <p className="text-sm text-slate-400">Inspect execution attempts and audit events across the platform.</p>
      </div>
      <LogPanels />
    </div>
  );
}
