# UI Prototype Notes

## Practice Application
- **Navigation**: Header with logo, question filters, and link to help page. Footer shows data-source attribution.
- **Question List**:
  - Card or table layout showing title, difficulty badge, applicable database tags, short description preview.
  - Filters on left sidebar: database tags (multi-select), categories, difficulty levels, search box on top.
  - Pagination sized for 20 items per page.
- **Question Detail**:
  - Three-column responsive layout:
    1. Problem statement pane with required fields and hints (collapsible hints).
    2. SQL editor pane using Monaco with syntax highlighting, keyboard shortcuts, run button.
    3. Results pane with tabs for `Results`, `Errors`, and `Reference Answer`.
  - Reference answer tab shows SQL per engine with copy-to-clipboard; default hidden but toggleable.
  - Execution summary banner displays runtime, row count, truncation status, and warnings.
- **Error Handling**: Inline alerts for validation errors, toast notifications for rate limiting or server issues.

## Admin Portal
- **Dashboard**:
  - Metrics cards: active instances, published questions, executions in last 24h, timeouts flagged.
  - Recent activity table showing latest admin actions and initialization jobs.
- **Database Instances**:
  - Table listing name, engine, status badge (Initialized/Needs Setup/Failed), timeout/row limit, last health check.
  - Row actions: edit, test connection, initialize, disable.
  - Detail drawer or edit page to update credentials, limits, tags.
- **Question Management**:
  - Table with filters for status, difficulty, category, instance tags; inline indicators for missing reference SQL.
  - Editor form with tabs per engine reference SQL and preview mode.
  - Bulk actions: publish/unpublish, export selection.
- **Import Wizard**:
  - Step 1: Upload file (CSV/JSON) with template download link.
  - Step 2: Validation report with success/error counts, per-row error messages.
  - Step 3: Confirmation summary and audit log entry.
- **Logs Center**:
  - Execution logs table with filters for time range, question, instance, result (success/timeout/rejected).
  - Audit logs table capturing admin actions; includes export buttons.
- **Settings Page**:
  - Form fields for global timeout, max rows, concurrency limit, rate-limit per minute, log retention days.
  - Save confirmation with immediate feedback.

## Visual Language
- Neutral light theme by default, with accent colors for difficulty badges and status chips.
- Consistent iconography for actions (play/run, eye for reference answer, download for export).
- Responsive layout ensuring practice interface usable on tablets (minimum width 1024px for editor).
