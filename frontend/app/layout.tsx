import "../styles/globals.css";
import type { Metadata } from "next";
import { ReactNode } from "react";

import AppHeader from "../components/common/app-header";
import QueryProvider from "../components/common/query-provider";
import ToastProvider from "../components/common/toast-provider";

export const metadata: Metadata = {
  title: "Northwind SQL Trainer",
  description: "Practice SQL queries against curated exercises",
  icons: {
    icon: "/er-northwind.png",
  },
};

export default function RootLayout({ children }: { children: ReactNode }) {
  return (
    <html lang="en">
      <body className="bg-slate-950 text-slate-100">
        <div className="min-h-screen flex flex-col">
          <AppHeader />
          <QueryProvider>
            <ToastProvider>
              <main className="flex-1 bg-slate-950/90">{children}</main>
            </ToastProvider>
          </QueryProvider>
          <footer className="border-t border-slate-800 bg-slate-900/80">
            <div className="mx-auto max-w-6xl px-6 py-4 text-xs text-slate-500">
              Northwind sample data courtesy of Microsoft. Built for SQL practice.
            </div>
          </footer>
        </div>
      </body>
    </html>
  );
}
