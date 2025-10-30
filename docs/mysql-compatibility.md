# MySQL Compatibility Notes

## Initialization Workflow
1. Ensure target server uses MySQL 8.0+ with `utf8mb4` default charset.
2. Create the database if missing: `CREATE DATABASE northwind CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;`.
3. Execute structural script `northwind.sql` from https://raw.githubusercontent.com/busynovadad/northwind-MySQL/refs/heads/master/northwind.sql.
4. Execute data script `northwind-data.sql` from https://raw.githubusercontent.com/busynovadad/northwind-MySQL/refs/heads/master/northwind-data.sql.
5. Grant read-only privileges to practice user: `GRANT SELECT ON northwind.* TO 'practice'@'%';`.
6. Record job status in `db_init_jobs` with logs for troubleshooting.

## Schema & Data Differences vs PostgreSQL
- Auto-increment columns use `AUTO_INCREMENT` and may require `LAST_INSERT_ID` when writing (not needed here but note for reference answers).
- Date/time functions differ: use `DATE_FORMAT`, `TIMESTAMPDIFF`, `EXTRACT` for MySQL; avoid `DATE_TRUNC` or `AGE` equivalents.
- Boolean fields represented as `TINYINT(1)`; reference answers should cast to `BOOLEAN`-like output if needed.
- Identifier quoting uses backticks (`) instead of double quotes.
- Limit clause `LIMIT {offset}, {count}` also acceptable; prefer standard `LIMIT ... OFFSET ...` syntax to align with PostgreSQL.

## Reference SQL Authoring Guidelines
- Provide separate SQL text per engine (`reference_sql_mysql` vs `reference_sql_pg`).
- Avoid engine-specific functions unless necessary; document differences in question notes.
- When window functions are unavailable or behave differently, supply alternative solutions (subqueries, derived tables) or restrict question to compatible engines.
- Test reference SQL during import using the configured engine connection to ensure correctness.

## Known Compatibility Considerations
- CTE support requires MySQL 8.0+; ensure scripts and engine validation enforce minimum version.
- Collation differences can affect ordering; specify explicit `ORDER BY` where deterministic results are required.
- Case sensitivity for identifiers may differ by OS; prefer lowercase table aliases and references.
- MySQL's handling of NULL comparisons needs `IS NULL` / `IS NOT NULL` to avoid surprises.

## Maintenance Checklist
- Verify upstream scripts for updates; mirror validated versions within deployment artifacts.
- Include automated smoke tests querying key Northwind tables to ensure schema consistency after initialization.
- Document any additional indexes added to match PostgreSQL performance when required.
