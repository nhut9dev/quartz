---
title: Common table expression
description: A named temporary result set defined with WITH that you can reference within a query.
tags:
  - database
  - sql
---

A **CTE** (common table expression) names a subquery with `WITH` so the rest of the statement can reference it like a table.

## How it works

CTEs break a complex query into readable, named steps that read top to bottom instead of deeply nested subqueries. A `RECURSIVE` CTE references itself, which is how you walk trees and graphs such as org charts or category hierarchies.

```sql
WITH RECURSIVE subordinates AS (
  SELECT id, manager_id FROM employees WHERE id = 1
  UNION ALL
  SELECT e.id, e.manager_id
  FROM employees e
  JOIN subordinates s ON e.manager_id = s.id
)
SELECT * FROM subordinates;
```

## When to use

Reach for a CTE when a query has repeated subqueries, multiple stages of aggregation, or recursive traversal. They improve readability without changing results, and a single CTE can be referenced several times in one statement.

## Pitfalls

Materialization is the key gotcha. Older Postgres always materialized a CTE into a temporary result, blocking the planner from pushing filters down across it (an "optimization fence"). Postgres 12+ inlines simple CTEs by default but still materializes recursive or multiply-referenced ones; use `MATERIALIZED` / `NOT MATERIALIZED` to override. Check the plan with [[explain-analyze|EXPLAIN ANALYZE]] when a CTE rewrite changes performance.
