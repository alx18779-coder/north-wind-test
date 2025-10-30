"use client";

import dynamic from "next/dynamic";
import { useMemo } from "react";

const MonacoEditor = dynamic(() => import("@monaco-editor/react"), { ssr: false });

interface Props {
  value: string;
  onChange: (value: string) => void;
  disabled?: boolean;
}

export default function SqlEditor({ value, onChange, disabled }: Props) {
  const options = useMemo(
    () => ({
      minimap: { enabled: false },
      readOnly: disabled,
      fontSize: 13,
      automaticLayout: true,
      wordWrap: "on" as const,
      ariaLabel: "SQL 编辑器",
    }),
    [disabled]
  );

  return (
    <div className="rounded border border-slate-700 bg-slate-950">
      <MonacoEditor
        height="220px"
        defaultLanguage="sql"
        theme="vs-dark"
        value={value}
        onChange={(val) => onChange(val ?? "")}
        options={options}
      />
    </div>
  );
}
