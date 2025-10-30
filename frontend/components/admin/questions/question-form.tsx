"use client";

import { useRouter } from "next/navigation";
import { useState } from "react";

import adminApi, {
  QuestionCreateRequest,
  QuestionDetail,
} from "../../../lib/admin-api";
import useToast from "../../../lib/hooks/use-toast";

interface Props {
  initialQuestion?: QuestionDetail;
}

const DIFFICULTY_OPTIONS = ["beginner", "intermediate", "advanced"];

const DIFFICULTY_LABELS: Record<string, string> = {
  beginner: "初级",
  intermediate: "中级",
  advanced: "高级",
};

const buildPayloadFromDetail = (question: QuestionDetail): QuestionCreateRequest => ({
  question_id: question.question_id,
  title: question.title,
  description: question.description,
  required_fields: question.required_fields,
  difficulty: question.difficulty,
  category: question.category,
  status: question.status,
  instance_tags: question.instance_tags,
  notes: question.notes ?? undefined,
  reference_sql: question.reference_sql.map((ref) => ({ engine: ref.engine, sql_text: ref.sql_text })),
  hints: question.hints.map((hint) => ({ display_order: hint.display_order, content: hint.content })),
});

export default function QuestionForm({ initialQuestion }: Props) {
  const router = useRouter();
  const toast = useToast();
  const [form, setForm] = useState<QuestionCreateRequest>(() =>
    initialQuestion
      ? buildPayloadFromDetail(initialQuestion)
      : {
          question_id: "",
          title: "",
          description: "",
          required_fields: "",
          difficulty: "beginner",
          category: "",
          status: "draft",
          instance_tags: ["pg_default"],
          notes: "",
          reference_sql: [
            { engine: "postgres", sql_text: "" },
          ],
          hints: [],
        }
  );
  const [error, setError] = useState<string | null>(null);
  const [isSubmitting, setIsSubmitting] = useState(false);

  const isEdit = Boolean(initialQuestion);

  const handleChange = <K extends keyof QuestionCreateRequest>(key: K, value: QuestionCreateRequest[K]) => {
    setForm((prev) => ({ ...prev, [key]: value }));
  };

  const handleReferenceChange = (index: number, key: "engine" | "sql_text", value: string) => {
    setForm((prev) => {
      const next = [...prev.reference_sql];
      next[index] = { ...next[index], [key]: value };
      return { ...prev, reference_sql: next };
    });
    setError(null);
  };

  const handleHintChange = (index: number, key: "display_order" | "content", value: string) => {
    setForm((prev) => {
      const next = [...prev.hints];
      next[index] = { ...next[index], [key]: key === "display_order" ? Number(value) : value } as QuestionCreateRequest["hints"][number];
      return { ...prev, hints: next };
    });
  };

  const submit = async () => {
    if (form.reference_sql.length === 0 || form.reference_sql.some((ref) => !ref.sql_text.trim())) {
      setError("请至少填写一条参考 SQL");
      toast.showError("请先填写参考 SQL");
      return;
    }
    const normalizedTags = Array.from(
      new Set(form.instance_tags.map((tag) => tag.trim()).filter((tag) => tag.length > 0))
    );
    if (normalizedTags.length === 0) {
      setError("请至少配置一个实例标签");
      toast.showError("请先配置实例标签");
      return;
    }
    setForm((prev) => ({ ...prev, instance_tags: normalizedTags }));
    setIsSubmitting(true);
    setError(null);
    try {
      const payload: QuestionCreateRequest = { ...form, instance_tags: normalizedTags };
      if (isEdit && initialQuestion) {
        await adminApi.updateQuestion(initialQuestion.id, payload);
        toast.showSuccess("题目已更新");
      } else {
        await adminApi.createQuestion(payload);
        toast.showSuccess("题目已创建");
      }
      router.push("/admin/questions");
    } catch (err: any) {
      setError(err?.response?.data?.detail ?? "保存题目失败");
      toast.showError("保存题目失败");
    } finally {
      setIsSubmitting(false);
    }
  };

  const addReference = () => {
    setForm((prev) => ({ ...prev, reference_sql: [...prev.reference_sql, { engine: "postgres", sql_text: "" }] }));
  };

  const removeReference = (index: number) => {
    setForm((prev) => ({ ...prev, reference_sql: prev.reference_sql.filter((_, idx) => idx !== index) }));
  };

  const addHint = () => {
    setForm((prev) => ({ ...prev, hints: [...prev.hints, { display_order: prev.hints.length + 1, content: "" }] }));
  };

  const removeHint = (index: number) => {
    setForm((prev) => ({ ...prev, hints: prev.hints.filter((_, idx) => idx !== index) }));
  };

  return (
    <form
      onSubmit={(event) => {
        event.preventDefault();
        submit();
      }}
      className="space-y-5"
    >
      <div className="grid grid-cols-1 gap-4 md:grid-cols-2">
        <label className="flex flex-col gap-1 text-sm">
          <span className="text-xs uppercase text-slate-400">题目编号</span>
          <input
            required
            value={form.question_id}
            onChange={(event) => handleChange("question_id", event.target.value)}
            className="rounded border border-slate-700 bg-slate-900 px-3 py-2 text-slate-100"
            disabled={isEdit}
          />
        </label>
        <label className="flex flex-col gap-1 text-sm">
          <span className="text-xs uppercase text-slate-400">题目标题</span>
          <input
            required
            value={form.title}
            onChange={(event) => handleChange("title", event.target.value)}
            className="rounded border border-slate-700 bg-slate-900 px-3 py-2 text-slate-100"
          />
        </label>
        <label className="flex flex-col gap-1 text-sm">
          <span className="text-xs uppercase text-slate-400">难度</span>
          <select
            value={form.difficulty}
            onChange={(event) => handleChange("difficulty", event.target.value)}
            className="rounded border border-slate-700 bg-slate-900 px-3 py-2 text-slate-100"
          >
            {DIFFICULTY_OPTIONS.map((option) => (
              <option key={option} value={option}>
                {DIFFICULTY_LABELS[option] ?? option}
              </option>
            ))}
          </select>
        </label>
        <label className="flex flex-col gap-1 text-sm">
          <span className="text-xs uppercase text-slate-400">分类</span>
          <input
            value={form.category}
            onChange={(event) => handleChange("category", event.target.value)}
            className="rounded border border-slate-700 bg-slate-900 px-3 py-2 text-slate-100"
          />
        </label>
        <label className="flex flex-col gap-1 text-sm">
          <span className="text-xs uppercase text-slate-400">状态</span>
          <select
            value={form.status}
            onChange={(event) => handleChange("status", event.target.value)}
            className="rounded border border-slate-700 bg-slate-900 px-3 py-2 text-slate-100"
          >
            <option value="draft">草稿</option>
            <option value="published">已发布</option>
          </select>
        </label>
        <label className="flex flex-col gap-1 text-sm">
          <span className="text-xs uppercase text-slate-400">实例标签</span>
          <input
            value={form.instance_tags.join(", ")}
            onChange={(event) => handleChange("instance_tags", event.target.value.split(",").map((tag) => tag.trim()))}
            className="rounded border border-slate-700 bg-slate-900 px-3 py-2 text-slate-100"
          />
        </label>
      </div>

      <label className="flex flex-col gap-1 text-sm">
        <span className="text-xs uppercase text-slate-400">题目描述</span>
        <textarea
          required
          value={form.description}
          onChange={(event) => handleChange("description", event.target.value)}
          className="min-h-[120px] rounded border border-slate-700 bg-slate-900 px-3 py-2 text-slate-100"
        />
      </label>

      <label className="flex flex-col gap-1 text-sm">
        <span className="text-xs uppercase text-slate-400">预期字段</span>
        <textarea
          value={form.required_fields}
          onChange={(event) => handleChange("required_fields", event.target.value)}
          className="min-h-[80px] rounded border border-slate-700 bg-slate-900 px-3 py-2 text-slate-100"
        />
      </label>

      <label className="flex flex-col gap-1 text-sm">
        <span className="text-xs uppercase text-slate-400">备注</span>
        <textarea
          value={form.notes ?? ""}
          onChange={(event) => handleChange("notes", event.target.value)}
          className="min-h-[80px] rounded border border-slate-700 bg-slate-900 px-3 py-2 text-slate-100"
        />
      </label>

      <section className="space-y-3">
        <div className="flex items-center justify-between">
          <h3 className="text-sm font-semibold text-slate-100">参考 SQL</h3>
          <button type="button" onClick={addReference} className="text-xs text-emerald-300 hover:text-emerald-200">
            新增引擎
          </button>
        </div>
        <div className="space-y-4">
          {form.reference_sql.map((ref, index) => (
            <div key={index} className="rounded border border-slate-800 bg-slate-950 p-3">
              <div className="flex items-center justify-between text-xs text-slate-400">
                <span>引擎 #{index + 1}</span>
                {form.reference_sql.length > 1 && (
                  <button type="button" onClick={() => removeReference(index)} className="text-rose-300 hover:text-rose-200">
                    删除
                  </button>
                )}
              </div>
              <div className="mt-2 flex flex-col gap-2">
                <select
                  value={ref.engine}
                  onChange={(event) => handleReferenceChange(index, "engine", event.target.value)}
                  className="rounded border border-slate-700 bg-slate-900 px-3 py-2 text-slate-100"
                >
                  <option value="postgres">PostgreSQL</option>
                  <option value="mysql">MySQL</option>
                </select>
                <textarea
                  value={ref.sql_text}
                  onChange={(event) => handleReferenceChange(index, "sql_text", event.target.value)}
                  className="min-h-[100px] rounded border border-slate-700 bg-slate-900 px-3 py-2 font-mono text-xs text-slate-100"
                />
              </div>
            </div>
          ))}
        </div>
      </section>

      <section className="space-y-3">
        <div className="flex items-center justify-between">
          <h3 className="text-sm font-semibold text-slate-100">提示</h3>
          <button type="button" onClick={addHint} className="text-xs text-emerald-300 hover:text-emerald-200">
            新增提示
          </button>
        </div>
        <div className="space-y-4">
          {form.hints.map((hint, index) => (
            <div key={index} className="rounded border border-slate-800 bg-slate-950 p-3">
              <div className="flex items-center justify-between text-xs text-slate-400">
                <span>提示 #{index + 1}</span>
                <button type="button" onClick={() => removeHint(index)} className="text-rose-300 hover:text-rose-200">
                  删除
                </button>
              </div>
              <div className="mt-2 flex gap-3">
                <input
                  type="number"
                  min={1}
                  value={hint.display_order}
                  onChange={(event) => handleHintChange(index, "display_order", event.target.value)}
                  className="w-24 rounded border border-slate-700 bg-slate-900 px-3 py-2 text-slate-100"
                />
                <textarea
                  value={hint.content}
                  onChange={(event) => handleHintChange(index, "content", event.target.value)}
                  className="flex-1 rounded border border-slate-700 bg-slate-900 px-3 py-2 text-slate-100"
                />
              </div>
            </div>
          ))}
        </div>
      </section>

      {error && <div className="rounded border border-rose-700 bg-rose-950 px-3 py-2 text-xs text-rose-200">{error}</div>}

      <div className="flex gap-3">
        <button
          type="submit"
          disabled={isSubmitting}
          className="rounded bg-emerald-500 px-4 py-2 text-sm font-medium text-emerald-950 hover:bg-emerald-400 disabled:cursor-not-allowed"
        >
          {isSubmitting ? "保存中..." : isEdit ? "更新题目" : "创建题目"}
        </button>
        <button
          type="button"
          onClick={() => router.back()}
          className="rounded border border-slate-600 px-4 py-2 text-sm text-slate-200 hover:bg-slate-800"
        >
          取消
        </button>
      </div>
    </form>
  );
}
