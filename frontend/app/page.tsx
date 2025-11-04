import Link from "next/link";

export default function HomePage() {
  return (
    <section className="mx-auto flex max-w-5xl flex-col gap-6 px-6 py-16">
      <h1 className="text-3xl font-bold text-slate-50">Northwind 数据库简介</h1>
      <p className="text-slate-300 leading-7">
        Northwind 是一个经典的示例数据库，最早由 Microsoft 提供，包含了“北风贸易公司”的业务数据。
        数据围绕产品、客户、订单与员工等实体展开，非常适合作为 SQL 学习与练习的数据集。
      </p>
      <div className="grid gap-3 text-slate-300 text-sm">
        <p>
          主要表：Customers（客户）、Orders（订单）、Order Details（订单明细）、Employees（员工）、Products（产品）、
          Suppliers（供应商）、Categories（品类）、Shippers（承运商）等。
        </p>
        <p>
          你可以在本平台基于 Northwind 数据完成从基础查询到多表连接、聚合、窗口函数等不同难度的练习，系统会给出参考答案与执行限制，帮助你安全高效地提升 SQL 能力。
        </p>
      </div>
      <div className="pt-2">
        <Link
          href="/practice"
          className="inline-block rounded-md bg-emerald-500 px-5 py-2 text-sm font-medium text-emerald-950 shadow hover:bg-emerald-400"
        >
          开始练习
        </Link>
      </div>
      <div className="mt-6 flex flex-wrap gap-3 text-sm">
        <Link
          href="/docs/northwind-schema"
          className="rounded border border-slate-700 px-3 py-1 text-slate-200 hover:bg-slate-800"
        >
          表结构（DDL）
        </Link>
        <Link
          href="/docs/northwind-er"
          className="rounded border border-slate-700 px-3 py-1 text-slate-200 hover:bg-slate-800"
        >
          ER 图/关系概览
        </Link>
      </div>
    </section>
  );
}
