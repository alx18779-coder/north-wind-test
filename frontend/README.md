# Northwind SQL Trainer Frontend

A Next.js 14 + React 18 application for the Northwind SQL practice platform. It provides a practice workspace, administrator dashboards, and shared UI infrastructure for future development.

## Getting Started

```bash
cd frontend
pnpm install    # or npm install / yarn
pnpm dev        # runs Next.js dev server on http://localhost:3000
```

Environment variables (create `.env.local`):

```
NEXT_PUBLIC_API_BASE_URL=http://localhost:8000/api
```

## Structure

- `app/` – Next.js App Router routes for home, practice, admin, and login.
- `components/` – Shared UI components for practice workspace, admin dashboard, and auth form.
- `lib/` – Axios HTTP client, API helpers, and React Query hooks.
- `styles/` – Tailwind CSS global styles.

The project ships with Tailwind CSS, React Query, Axios, and Zustand (reserved for future state management needs).
