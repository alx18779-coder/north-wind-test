"use client";

import { useState } from "react";

import adminApi, { QuestionCreateRequest } from "../../../lib/admin-api";
import useToast from "../../../lib/hooks/use-toast";

export default function QuestionImport() {
  const [fileName, setFileName] = useState<string>("");
  const [isUploading, setIsUploading] = useState(false);
  const [message, setMessage] = useState<string | null>(null);
  const [error, setError] = useState<string | null>(null);
  const toast = useToast();

  const handleFileChange = async (event: React.ChangeEvent<HTMLInputElement>) => {
    const file = event.target.files?.[0];
    if (!file) return;
    setFileName(file.name);
    setIsUploading(true);
    setMessage(null);
    setError(null);
    try {
      const text = await file.text();
      const payload = JSON.parse(text) as QuestionCreateRequest[];
      const response = await adminApi.importQuestions(payload);
      setMessage(`导入成功 ${response.data.success_count} 条，失败 ${response.data.failure_count} 条`);
      toast.showSuccess("导入完成");
      if (response.data.report?.failures?.length) {
        setError(JSON.stringify(response.data.report.failures, null, 2));
      }
    } catch (err: any) {
      setError(err?.message ?? "导入失败");
      toast.showError("题目导入失败");
    } finally {
      setIsUploading(false);
    }
  };

  const handleDownloadTemplate = () => {
    const template: QuestionCreateRequest = {
      question_id: "Q001",
      title: "示例题目",
      description: "请描述练习内容",
      required_fields: "字段1, 字段2",
      difficulty: "beginner",
      category: "聚合",
      status: "draft",
      instance_tags: ["pg_default"],
      notes: "可填写备注信息",
      reference_sql: [
        { engine: "postgres", sql_text: "SELECT * FROM customers;" },
      ],
      hints: [
        { display_order: 1, content: "从 SELECT 开始" },
      ],
    };
    const blob = new Blob([JSON.stringify([template], null, 2)], { type: "application/json" });
    const url = URL.createObjectURL(blob);
    const link = document.createElement("a");
    link.href = url;
    link.download = "question-template.json";
    link.click();
    URL.revokeObjectURL(url);
  };

  return (
    <div className="rounded border border-slate-800 bg-slate-900 p-6 text-sm text-slate-200">
      <div className="flex items-center justify-between">
        <div>
          <h2 className="text-lg font-semibold text-slate-50">批量导入题目</h2>
          <p className="text-xs text-slate-400">上传符合题目模版结构的 JSON 文件。</p>
        </div>
        <button
          onClick={handleDownloadTemplate}
          className="rounded border border-slate-600 px-3 py-1 text-xs text-slate-200 hover:bg-slate-800"
        >
          下载模版
        </button>
      </div>

      <div className="mt-4 flex flex-col gap-3">
        <input type="file" accept="application/json" onChange={handleFileChange} disabled={isUploading} />
        {fileName && <div className="text-xs text-slate-400">已选择文件：{fileName}</div>}
        {isUploading && <div className="text-xs text-slate-400">正在导入...</div>}
        {message && <div className="rounded border border-emerald-700 bg-emerald-950 px-3 py-2 text-xs text-emerald-200">{message}</div>}
        {error && (
          <pre className="overflow-x-auto rounded border border-rose-700 bg-rose-950 px-3 py-2 text-xs text-rose-200">
            {error}
          </pre>
        )}
      </div>
    </div>
  );
}
