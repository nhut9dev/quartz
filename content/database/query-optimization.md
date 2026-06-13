---
title: Query optimization
description: The practice of making database queries faster and less expensive.
tags:
  - database
---

**Query optimization** is the practice of making a query find, filter, join, and sort data with less time and fewer resources — driven by evidence from the query's actual execution, not guesswork.

## Measure first

The defining discipline is to optimize from evidence. Find the genuinely slow query (from logs or [[../backend-performance/apm|APM]]), inspect its [[query-plan|plan]] with [[explain-analyze|EXPLAIN ANALYZE]], and change the query or schema based on the *actual* bottleneck the plan reveals. A query that "looks slow" often isn't the problem, and the obvious fix (add an index) is frequently the wrong one. The plan tells you whether the cost is a sequential scan, a bad join order, a sort spilling to disk, or row-count estimates gone stale.

## Common levers

- **[[database-index|Indexes]]** — turn a sequential scan into an index scan for selective filters, joins, and `ORDER BY`.
- **Select only needed columns** — avoid `SELECT *` so the planner can use covering indexes and move less data.
- **Reduce round trips** — fix the [[n-plus-one-problem|N+1 problem]]; fetch related data in one query rather than per-row.
- **Filter early, limit results** — push `WHERE` and `LIMIT` down so the database does less work, not the application.
- **Refresh statistics** — stale stats make the planner choose bad plans; `ANALYZE` fixes estimate-vs-actual gaps.

## Pitfalls

The reflex to "add an index" treats every slow query as an indexing problem — but an index does nothing for a query that returns most of the table, costs write performance, and can even be ignored by the planner if selectivity is low. Optimizing a query nobody runs often, or micro-tuning before measuring, spends effort where it doesn't move the needle. And a query fast on a small dev dataset can have a catastrophic plan at production scale, so test against realistic data volumes.
