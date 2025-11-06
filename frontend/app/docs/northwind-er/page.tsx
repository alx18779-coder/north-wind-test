export const dynamic = "force-static";

export default function NorthwindErPage() {
  const imgUrl = "/er-northwind.png"; // 本地静态资源，位于 frontend/public/er-northwind.png
  return (
    <section className="mx-auto max-w-5xl px-6 py-10">
      <h1 className="text-2xl font-semibold text-slate-50">Northwind ER 关系图</h1>
      <p className="mt-2 text-sm text-slate-400">这是 Northwind 示例数据库的实体-关系图（ERD）。</p>
      <div className="mt-4 overflow-hidden rounded border border-slate-800 bg-slate-900/60 p-2">
        {/* eslint-disable-next-line @next/next/no-img-element */}
        <img
          src={imgUrl}
          alt="Northwind 实体关系图"
          className="mx-auto h-auto w-full max-w-[1200px] rounded"
          loading="lazy"
        />
      </div>
    </section>
  );
}
