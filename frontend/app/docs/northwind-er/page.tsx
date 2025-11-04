export const dynamic = "force-static";

export default function NorthwindErPage() {
  const imgUrl = "https://image.141029.xyz/2025/11/e4e3b49bc36e59d27cd165cd48f6b4f1.png";
  return (
    <section className="mx-auto max-w-5xl px-6 py-10">
      <h1 className="text-2xl font-semibold text-slate-50">Northwind ER 关系图</h1>
      <p className="mt-2 text-sm text-slate-400">
        这是 Northwind 示例数据库的实体-关系图（ERD）。点击图片可在新窗口查看原图。
      </p>
      <div className="mt-4 overflow-hidden rounded border border-slate-800 bg-slate-900/60 p-2">
        <a href={imgUrl} target="_blank" rel="noreferrer noopener">
          {/* 使用原生 img 避免 Next/Image 域名白名单 */}
          {/* eslint-disable-next-line @next/next/no-img-element */}
          <img
            src={imgUrl}
            alt="Northwind 实体关系图"
            className="mx-auto h-auto w-full max-w-[1200px] rounded"
            loading="lazy"
          />
        </a>
      </div>
      <p className="mt-3 text-xs text-slate-500">
        如无法加载，请检查网络策略或将图片下载到本仓库后改为本地引用。
      </p>
    </section>
  );
}
