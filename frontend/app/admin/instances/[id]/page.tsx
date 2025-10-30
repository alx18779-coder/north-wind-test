import InstanceDetail from "../../../../components/admin/instances/instance-detail";

interface Props {
  params: {
    id: string;
  };
}

export default function InstanceDetailPage({ params }: Props) {
  const instanceId = Number(params.id);
  return (
    <div className="mx-auto flex max-w-5xl flex-col gap-6 px-6 py-10">
      <div>
        <h1 className="text-2xl font-semibold text-slate-50">Instance Detail</h1>
        <p className="text-sm text-slate-400">Review and control the selected database connection.</p>
      </div>
      <InstanceDetail instanceId={instanceId} />
    </div>
  );
}
