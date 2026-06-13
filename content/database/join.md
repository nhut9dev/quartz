---
title: Join
description: A SQL operation that combines rows from related tables.
tags:
  - database
  - sql
---

A **join** combines rows from two or more tables based on a relationship between them, letting a [[normalization|normalized]] schema reassemble data that's been split across tables.

```sql
select users.name, orders.total
from users
join orders on orders.user_id = users.id;
```

## How it works

A join matches rows from the left and right tables wherever the join condition holds — here, each order pairs with the user whose `id` equals its `user_id`. This is what makes normalization practical: an order stores only `user_id`, not a copy of the user's name and email, and the join stitches them back together at query time. The database doesn't loop in application code; it evaluates the join as a set operation using whatever [[query-plan|plan]] is cheapest.

## The join types

- **Inner join** — only rows that match on both sides. The default and most common.
- **Left (outer) join** — all rows from the left table, with `NULL`s where the right has no match. Used to keep a base set and optionally attach related data ("all users, with their orders if any").
- **Right join** — the mirror of left; usually rewritten as a left join for readability.
- **Full outer join** — all rows from both sides, matched where possible. Used to reconcile two sets.
- **Cross join** — every left row paired with every right row (Cartesian product); rarely intended.

## How the database executes it

The planner picks a physical strategy by cost: a **nested loop** (for each left row, look up matches — good for small inputs or an indexed key), a **hash join** (build a hash table on one side, probe with the other — good for large unsorted sets), or a **merge join** (both inputs sorted, walked in step). The join *column* matters enormously: joining on an indexed key (a foreign key with an index) lets the planner avoid scanning, while joining on an unindexed column forces expensive full scans.

## Pitfalls

The classic correctness bug is an **unintended fan-out**: joining to a table with multiple matching rows multiplies the result (one order joined to three line items returns three rows), silently inflating any `SUM` or `COUNT` over it. A missing index on the join column turns a join into a scan-heavy query that's fine in dev and catastrophic at scale — confirm with the [[query-plan|query plan]]. And accidentally writing an inner join where you meant a left join silently drops rows that have no match, so a "missing data" bug is often a wrong join type, not missing data.
