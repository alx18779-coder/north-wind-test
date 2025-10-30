"use client";

import Link from "next/link";
import { useQuery } from "@tanstack/react-query";
import { useMemo, useState } from "react";

import adminApi, { QuestionSummary } from "../../../lib/admin-api";

const difficultyMap: Record<string, string> = {
  beginner: "初级",
  intermediate: "中级",
  advanced: "高级",
};

const fetchQuestions = async () => {
  const response = await adminApi.listQuestions();
  return response.data;
};

export default function QuestionTable() {
  const { data, isLoading, error } = useQuery({ queryKey: ["questions"], queryFn: fetchQuestions });
  const [search, setSearch] = useState("");
  const [difficulty, set难度] = useState("all");
  const [status, set状态] = useState("all");

  const filtered = useMemo(() => {
    if (!data) return [];
    return data.filter((question) => {
      const matchesSearch = search
        ? question.title.toLowerCase().includes(search.toLowerCase()) ||
          question.question_id.toLowerCase().includes(search.toLowerCase())
        : true;
      const matches难度 = difficulty === "all" || question.difficulty === difficulty;
      const matches状态 = status === "all" || question.status === status;
      return matchesSearch && matches难度 && matches状态;
    });
  }, [data, search, difficulty, status]);

  return (
    <div className="rounded border border-slate-800 bg-slate-900">
      <div className="flex items-center justify-between border-b border-slate-800 px-4 py-3">
        <h2 className="text-sm font-semibold text-slate-100">题库</h2>
        <div className="flex gap-2">
          <button
            onClick={async () => {
              const response = await adminApi.exportQuestions();
              const blob = new Blob([JSON.stringify(response.data, null, 2)], { type: "application/json" });
              const url = URL.createObjectURL(blob);
              const link = document.createElement("a");
              link.href = url;
              link.download = "questions-export.json";
              link.click();
              URL.revokeObjectURL(url);
            }}
            className="rounded border border-slate-600 px-3 py-1 text-xs text-slate-200 hover:bg-slate-800"
          >
            导出
          </button>
          <Link
            href="/admin/questions/new"
            className="rounded border border-emerald-600 px-3 py-1 text-xs text-emerald-200 hover:bg-emerald-600/20"
          >
            新建题目
          </Link>
        </div>
      </div>
      <div className="px-4 py-4 text-sm text-slate-300">
        <div className="flex flex-wrap items-center gap-3 pb-4 text-xs text-slate-300">
          <input
            placeholder="搜索标题或题号"
            value={search}
            onChange={(event) => setSearch(event.target.value)}
            className="rounded border border-slate-700 bg-slate-900 px-3 py-2 text-slate-100"
          />
          <select
            value={difficulty}
            onChange={(event) => set难度(event.target.value)}
            className="rounded border border-slate-700 bg-slate-900 px-3 py-2 text-slate-100"
          >
            <option value="all">全部难度</option>
            <option value="beginner">初级</option>
            <option value="intermediate">中级</option>
            <option value="advanced">高级</option>
          </select>
          <select
            value={status}
            onChange={(event) => set状态(event.target.value)}
            className="rounded border border-slate-700 bg-slate-900 px-3 py-2 text-slate-100"
          >
            <option value="all">全部状态</option>
            <option value="draft">草稿</option>
            <option value="published">已发布</option>
          </select>
        </div>
        {isLoading && <div className="text-xs text-slate-400">正在加载题目...</div>}
        {error && <div className="text-xs text-rose-300">题目加载失败</div>}
        <div className="overflow-x-auto">
          <table className="min-w-full text-left text-xs">
            <thead className="bg-slate-800 text-slate-400">
              <tr>
                <th className="px-4 py-2">题号</th>
                <th className="px-4 py-2">标题</th>
                <th className="px-4 py-2">难度</th>
                <th className="px-4 py-2">分类</th>
                <th className="px-4 py-2">状态</th>
                <th className="px-4 py-2" />
              </tr>
            </thead>
            <tbody>
              {filtered.map((question: QuestionSummary) => (
                <tr key={question.id} className="border-b border-slate-800/60">
                  <td className="px-4 py-2 font-mono text-slate-200">{question.question_id}</td>
                  <td className="px-4 py-2 text-slate-200">{question.title}</td>
                  <td className="px-4 py-2 text-slate-300">{difficultyMap[question.difficulty] ?? question.difficulty}</td>
                  <td className="px-4 py-2 text-slate-300">{question.category}</td>
                  <td className="px-4 py-2 text-slate-300">{question.status === "published" ? "已发布" : "草稿"}</td>
                  <td className="px-4 py-2 text-slate-300">
                    <Link
                      href={`/admin/questions/${question.id}`}
                      className="rounded border border-slate-700 px-3 py-1 text-slate-200 hover:bg-slate-800"
                    >
                      编辑
                    </Link>
                  </td>
                </tr>
              ))}
            </tbody>
          </table>
        </div>
        {filtered.length === 0 && <div className="mt-3 text-xs text-slate-400">没有符合筛选条件的题目。</div>}
      </div>
    </div>
  );
}
