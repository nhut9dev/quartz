---
title: Composite index
description: A database index built from more than one column.
tags:
  - database
  - performance
---

A **composite index** is a single [[database-index|index]] built over more than one column, ordered by the first column, then the second within that, and so on — like a phone book sorted by last name then first name.

## How it works: the leftmost prefix

The defining rule is the **leftmost-prefix**: a composite index on `(a, b, c)` can serve queries filtering on `a`, on `a, b`, or on `a, b, c` — but *not* on `b` alone or `c` alone, because the index is only sorted by `b` *within* a fixed `a`. Just as a phone book sorted by (last, first) is useless for finding everyone named "John," an index on `(a, b)` can't help a query that filters only on `b`.

```sql
CREATE INDEX ON orders (tenant_id, created_at);
-- serves: WHERE tenant_id = ?            ✓
--         WHERE tenant_id = ? AND created_at > ?  ✓
--         WHERE created_at > ?           ✗ (skips the leading column)
```

## Column order

Order is the whole design decision, and `(tenant_id, created_at)` is a genuinely different index from `(created_at, tenant_id)`. The usual guidance: put **equality-filter columns before range columns** (an index on `(tenant_id, created_at)` filters the tenant exactly, then scans a contiguous time range within it), and put the most commonly-filtered column first so the most queries can use a prefix.

## Pitfalls

Creating overlapping composite indexes wastes space — if you have `(a, b)`, a separate index on `(a)` is usually redundant since the composite already covers the `a` prefix. Getting the order wrong produces an index the planner *won't* use for your actual queries, so it costs writes and storage while helping nothing. And a range condition stops the prefix early: in `(a, b, c)`, a range on `b` means `c` can't be used for further index filtering. Design from real query patterns and confirm usage with a [[query-plan|query plan]].
