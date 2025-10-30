import Link from "next/link";

export default function HomePage() {
  return (
    <section className="mx-auto flex max-w-4xl flex-col gap-6 px-6 py-16">
      <h1 className="text-3xl font-bold text-slate-50">Welcome to the Northwind SQL Trainer</h1>
      <p className="text-slate-300">
        Tackle curated SQL exercises based on the classic Northwind dataset. Jump straight into practice or manage
        the platform through the admin portal.
      </p>
      <div className="flex flex-wrap gap-4">
        <Link
          href="/practice"
          className="rounded-md bg-emerald-500 px-5 py-2 text-sm font-medium text-emerald-950 shadow hover:bg-emerald-400"
        >
          Start Practicing
        </Link>
        <Link
          href="/admin"
          className="rounded-md border border-slate-600 px-5 py-2 text-sm font-medium text-slate-200 hover:bg-slate-800"
        >
          Open Admin Portal
        </Link>
      </div>
    </section>
  );
}
