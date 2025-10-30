# User Flows & Information Architecture

## Anonymous Learner Flow
1. Landing on the practice site home page.
2. Browsing the question list with filters for category, difficulty, and database tags.
3. Selecting a question to open the detail view.
4. Reading the problem statement and required output fields.
5. Writing a SQL query in the editor panel.
6. Running the query and viewing the result grid or error output.
7. Toggling the reference answer panel on or off as needed.
8. Navigating to the next question or returning to the list.

## Administrator Flow
1. Navigating to the admin portal and authenticating with username and password.
2. Landing on the dashboard with instance health, question counts, and recent alerts.
3. Managing database instances:
   - Creating or editing instance records with engine type, credentials, and limits.
   - Testing connectivity and permissions.
   - Triggering one-click initialization.
4. Managing question bank:
   - Reviewing the question list with filters and search.
   - Creating or editing question details, required fields, hints, and reference SQL per engine.
   - Importing questions in bulk via CSV or JSON templates and reviewing validation feedback.
   - Exporting questions for backup or offline editing.
5. Reviewing logs and settings:
   - Downloading execution or audit logs within a date range.
   - Adjusting global configuration (timeout, row limit, concurrency thresholds, log retention).
6. Logging out or handing over to another administrator.

## Information Architecture Overview
- Practice App
  - Question List
  - Question Detail
  - Help / About
- Admin Portal
  - Dashboard
  - Database Instances
  - Questions
  - Import Tasks
  - Logs (Execution + Audit)
  - Settings
  - Account/Profile

## Page-Level Notes
- Question Detail splits viewport into problem description, SQL editor, and results/reference panes.
- Admin dashboard highlights quick stats and provides shortcuts to initialization tasks.
- Logs section supports table view with filters plus export actions for CSV or JSON.
