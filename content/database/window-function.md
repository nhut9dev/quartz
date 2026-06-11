---
title: Window function
description: A function that computes a value across a set of rows related to the current row without collapsing them.
tags:
  - database
  - sql
---

A **window function** computes a value over a "window" of related rows while keeping every input row in the output.

## How it works

The `OVER` clause defines the window. `PARTITION BY` splits rows into groups, and `ORDER BY` sets the order within each group. Ranking functions assign positions: `ROW_NUMBER` gives a unique number, `RANK` leaves gaps after ties, and `DENSE_RANK` does not. Aggregates like `SUM` paired with `ORDER BY` produce running totals.

```sql
SELECT
  user_id,
  created_at,
  amount,
  ROW_NUMBER() OVER (PARTITION BY user_id ORDER BY created_at)        AS nth_order,
  SUM(amount)  OVER (PARTITION BY user_id ORDER BY created_at)        AS running_total
FROM orders;
```

## vs GROUP BY

`GROUP BY` collapses rows into one row per group, losing detail. A window function returns the per-group computation alongside each original row, so you can keep raw data and aggregates together. That makes it the natural tool for "rank within category", "running totals", and "compare each row to its group average".

## Pitfalls

Window functions run after `WHERE` and `GROUP BY` but cannot be used inside them; filter on a ranked result by wrapping it in a [[cte|CTE]] or subquery. They also force a sort per partition, which can be expensive on large unindexed sets. An index matching `PARTITION BY` plus `ORDER BY` lets the planner avoid an extra sort.
