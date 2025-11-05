# Question Template & Import Rules

## Supported Formats
- **CSV**: UTF-8 (no BOM). All columns must appear in the header row.
- **JSON**: Array of objects with keys matching the schema below.

## Schema Definition
| Field | Type | Required | Description |
| --- | --- | --- | --- |
| `question_id` | string | yes | Unique identifier, recommended format `Q###`. |
| `title` | string | yes | Short name displayed in lists. |
| `description` | string | yes | Full problem statement, supports Markdown. |
| `required_fields` | string | yes | Free-text list of columns expected in the output. |
| `difficulty` | enum | yes | One of `beginner`, `intermediate`, `advanced`. |
| `category` | string | yes | Topic grouping (e.g., `joins`, `aggregation`). |
| `reference_sql_pg` | string | yes* | Reference SQL for PostgreSQL instances; empty if question not available on PG. |
| `reference_sql_mysql` | string | yes* | Reference SQL for MySQL instances; empty if question not available on MySQL. |
| `instance_tags` | array/string | yes | Comma-separated list or JSON array of instance tags the question supports. |
| `hints` | array/string | no | Optional hints; map to ordered list in UI. |
| `status` | enum | yes | `draft` or `published`. |
| `notes` | string | no | Internal remarks not shown to learners. |

`*` At least one reference SQL must be provided for the engines listed in `instance_tags`.

## CSV Example
```
question_id,title,description,required_fields,difficulty,category,reference_sql_pg,reference_sql_mysql,instance_tags,hints,status
Q001,Top Suppliers,"列出所有提供了4种以上不同商品的供应商。",SupplierID, intermediate,aggregation,"SELECT ...","SELECT ...","pg_default;mysql_default","多表 JOIN;使用 COUNT DISTINCT",published
```

## JSON Example
```json
[
  {
    "question_id": "Q001",
    "title": "Top Suppliers",
    "description": "列出所有提供了4种以上不同商品的供应商。",
    "required_fields": "SupplierID, CompanyName, ProductCount",
    "difficulty": "intermediate",
    "category": "aggregation",
    "reference_sql_pg": "SELECT ...",
    "reference_sql_mysql": "SELECT ...",
    "instance_tags": ["pg_default", "mysql_default"],
    "hints": ["多表 JOIN", "使用 COUNT DISTINCT"],
    "status": "published",
    "notes": "首批上线题目"
  }
]
```

## Validation Rules
1. `question_id` must be unique and immutable after creation.
2. Required enums (`difficulty`, `status`) must match predefined lists.
3. Each reference SQL must be a single `SELECT` statement (CTE allowed) without trailing semicolon.
4. SQL is validated against the bound database engine for syntax and read-only constraints.
5. `instance_tags` must reference existing database instance tags or predefined groups.
6. CSV imports treat semicolon (`;`) as recommended delimiter for multi-value fields; parser accepts comma-separated values wrapped in quotes.
7. Imports generate a validation report summarizing successes, warnings, and failures before committing changes.

## Import Workflow
1. Administrator downloads the latest CSV or JSON template from the admin portal.
2. Administrator populates the file, ensuring reference SQL aligns with engine capabilities.
3. Validate first: use “校验并预览” to run static checks (no data will be imported).
   - Checks include: required fields, enums (difficulty/status), instance_tags existence, engine coverage of reference_sql.
   - The preview lists per‑row errors. Fix them before importing.
4. Upload/Import after validation → records stored, audit log updated, summary displayed.
5. Failed rows can be exported for correction.

### Validation details
- difficulty: one of beginner/intermediate/advanced
- status: draft or published
- instance_tags: must reference existing instance tags configured in “数据库实例”
- reference_sql: at least one entry; the set of engines must cover the engines of the referenced instance_tags present in the system
