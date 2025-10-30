"use client";

import { useMemo, useState } from "react";

import { PracticeQuestionSummary } from "../../lib/practice-api";

const difficultyMap: Record<string, string> = {
  beginner: "初级",
  intermediate: "中级",
  advanced: "高级",
};

interface Props {
  selectedId: number | null;
  onSelect: (id: number) => void;
  questions: PracticeQuestionSummary[] | undefined;
  loading: boolean;
  error: boolean;
}

export default function QuestionList({ selectedId, onSelect, questions, loading, error }: Props) {
  const [search, setSearch] = useState("");
  const [difficulty, setDifficulty] = useState("all");

  const filtered = useMemo(() => {
    const source = questions ?? [];
    return source.filter((question) => {
      const matchesSearch = search
        ? question.title.toLowerCase().includes(search.toLowerCase()) ||
          question.question_id.toLowerCase().includes(search.toLowerCase())
        : true;
      const matchesDifficulty = difficulty === "all" || question.difficulty === difficulty;
      return matchesSearch && matchesDifficulty;
    });
  }, [questions, search, difficulty]);

  return (
    <div className="flex h-full flex-col rounded border border-slate-800 bg-slate-900">
      <div className="border-b border-slate-800 px-4 py-3 text-sm font-semibold text-slate-100">题目列表</div>
      <div className="space-y-2 px-4 py-3 text-xs text-slate-300">
        <input
          placeholder="搜索标题或题号"
          value={search}
          onChange={(event) => setSearch(event.target.value)}
          className="w-full rounded border border-slate-700 bg-slate-900 px-3 py-2 text-slate-100"
        />
        <select
          value={difficulty}
          onChange={(event) => setDifficulty(event.target.value)}
          className="w-full rounded border border-slate-700 bg-slate-900 px-3 py-2 text-slate-100"
        >
          <option value="all">全部难度</option>
          <option value="beginner">初级</option>
          <option value="intermediate">中级</option>
          <option value="advanced">高级</option>
        </select>
      </div>
      <div className="flex-1 overflow-y-auto px-2 pb-2">
        {loading && <div className="px-2 text-xs text-slate-400">正在加载题目...</div>}
        {error && <div className="px-2 text-xs text-rose-300">题目加载失败</div>}
        <ul className="space-y-2">
          {filtered.map((question) => {
            const isActive = question.id === selectedId;
            return (
              <li key={question.id}>
                <button
                  onClick={() => onSelect(question.id)}
                  className={
                    "w-full rounded border px-3 py-2 text-left text-xs transition-colors " +
                    (isActive
                      ? "border-emerald-600 bg-emerald-600/20 text-emerald-200"
                      : "border-slate-800 bg-slate-950 text-slate-300 hover:border-slate-600 hover:bg-slate-800")
                  }
                >
                  <div className="font-semibold text-slate-100">{question.title}</div>
                  <div className="mt-1 flex items-center justify-between text-[11px] uppercase tracking-wide text-slate-500">
                    <span>{difficultyMap[question.difficulty] ?? question.difficulty}</span>
                    <span>{question.category}</span>
                  </div>
                </button>
              </li>
            );
          })}
        </ul>
        {filtered.length === 0 && <div className="px-2 text-xs text-slate-500">没有符合筛选条件的题目。</div>}
      </div>
    </div>
  );
}
