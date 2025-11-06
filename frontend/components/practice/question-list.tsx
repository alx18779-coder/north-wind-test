"use client";

import { useEffect, useMemo, useState } from "react";

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
  selectedInstance: string | null;
  onInstanceChange: (instanceTag: string | null) => void;
}

export default function QuestionList({ selectedId, onSelect, questions, loading, error, selectedInstance, onInstanceChange }: Props) {
  const [search, setSearch] = useState("");
  const [difficulty, setDifficulty] = useState("all");
  const pageSize = 10;
  const [page, setPage] = useState(1);
  const selectedQuestion = useMemo(() => {
    if (!selectedId || !questions) return undefined;
    return questions.find((q) => q.id === selectedId);
  }, [selectedId, questions]);

  // 实例标签下拉来源：所有题目的标签并集
  const allInstanceTags = useMemo(() => {
    const set = new Set<string>();
    for (const q of questions ?? []) {
      (q.instance_tags || []).forEach((t) => set.add(t));
    }
    return Array.from(set).sort();
  }, [questions]);

  const filtered = useMemo(() => {
    const source = questions ?? [];
    return source.filter((question) => {
      const matchesSearch = search
        ? question.title.toLowerCase().includes(search.toLowerCase()) ||
          question.question_id.toLowerCase().includes(search.toLowerCase())
        : true;
      const matchesDifficulty = difficulty === "all" || question.difficulty === difficulty;
      const matchesInstance = selectedInstance ? question.instance_tags.includes(selectedInstance) : true;
      return matchesSearch && matchesDifficulty && matchesInstance;
    });
  }, [questions, search, difficulty, selectedInstance]);

  // 当筛选条件变化时，回到第1页
  useEffect(() => {
    setPage(1);
  }, [search, difficulty, selectedInstance]);

  // 若当前页超出范围，纠正到最后一页
  const totalPages = Math.max(1, Math.ceil((filtered?.length ?? 0) / pageSize));
  useEffect(() => {
    setPage((p) => (p > totalPages ? totalPages : p));
  }, [totalPages]);

  // 选中题目发生变化时，若该题在过滤结果中，则自动跳到包含它的页
  useEffect(() => {
    if (!selectedId || !filtered || filtered.length === 0) return;
    const idx = filtered.findIndex((q) => q.id === selectedId);
    if (idx >= 0) {
      const targetPage = Math.floor(idx / pageSize) + 1;
      if (targetPage !== page) setPage(targetPage);
    }
  }, [selectedId, filtered]);

  const start = (page - 1) * pageSize;
  const end = start + pageSize;
  const pageItems = filtered.slice(start, end);

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
        {allInstanceTags.length > 0 && (
          <select
            value={selectedInstance ?? ""}
            onChange={(e) => onInstanceChange(e.target.value || null)}
            className="w-full rounded border border-slate-700 bg-slate-900 px-3 py-2 text-slate-100"
          >
            <option value="">全部实例</option>
            {allInstanceTags.map((tag) => (
              <option key={tag} value={tag}>
                {tag}
              </option>
            ))}
          </select>
        )}
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
          {pageItems.map((question) => {
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
        {filtered.length > 0 && (
          <div className="mt-2 flex items-center justify-between px-2 pb-2 text-[11px] text-slate-400">
            <button
              onClick={() => setPage((p) => Math.max(1, p - 1))}
              disabled={page <= 1}
              className="rounded border border-slate-700 px-2 py-1 text-slate-200 disabled:opacity-50"
            >
              上一页
            </button>
            <div>
              第 <span className="text-slate-200">{page}</span> / {totalPages} 页， 共 {filtered.length} 题
            </div>
            <button
              onClick={() => setPage((p) => Math.min(totalPages, p + 1))}
              disabled={page >= totalPages}
              className="rounded border border-slate-700 px-2 py-1 text-slate-200 disabled:opacity-50"
            >
              下一页
            </button>
          </div>
        )}
      </div>
    </div>
  );
}
