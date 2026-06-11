---
title: EXPLAIN ANALYZE
description: A command that shows and measures the plan a database uses to run a query.
tags:
  - database
  - performance
  - sql
---

**EXPLAIN ANALYZE** runs a query and reports the actual execution plan with real timings, so you can see what the database did rather than guess.

## EXPLAIN vs EXPLAIN ANALYZE

`EXPLAIN` shows the planner's chosen [[query-plan|plan]] and its cost estimates without running the query. `EXPLAIN ANALYZE` actually executes it and adds real time and row counts. Use plain `EXPLAIN` for writes you do not want to run, and `ANALYZE` when you need ground truth.

```sql
EXPLAIN ANALYZE
SELECT * FROM orders WHERE user_id = 42;
```

```text
Index Scan using orders_user_id_idx on orders
  (cost=0.29..8.31 rows=2 width=64)
  (actual time=0.018..0.021 rows=2 loops=1)
  Index Cond: (user_id = 42)
```

## Reading the plan

Read from the most indented node outward; inner nodes feed their parents. A **Seq Scan** reads the whole table and is fine for small or unselective queries but a red flag on a large filtered one, where an **Index Scan** should appear instead. For joins, a **Nested Loop** suits small inputs, while a **Hash Join** wins on large unsorted sets.

## Spotting problems

Compare `rows` (estimated) against `actual ... rows`. A large gap means stale statistics, so run `ANALYZE` on the table. A Seq Scan with a heavy filter on a big table usually signals a missing index; add one and confirm the node flips to an Index Scan. See [[query-optimization|Query optimization]] and [[database-index|Database index]] for the fixes.
