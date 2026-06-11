---
title: Index internals
description: How database index structures work and why B-tree is the default choice.
tags:
  - database
  - performance
---

**Index internals** are the data structures behind a [[database-index|database index]], and the structure determines which queries an index can accelerate.

## Index types

A **B-tree** keeps keys sorted in a balanced tree, supporting equality, ranges, ordering, and prefix matches in logarithmic time. A **hash** index supports only equality but with smaller, flat lookups. **GiST** and **GIN** handle non-scalar data: GiST for geometric and nearest-neighbor queries, GIN for multi-value columns like full-text, arrays, and JSONB.

## Why B-tree is default

B-tree is the default because it covers the widest set of query shapes: `=`, `<`, `>`, `BETWEEN`, `ORDER BY`, and `LIKE 'prefix%'`. Hash indexes win nothing a B-tree cannot do for equality, so they are rarely worth their narrower scope.

```sql
-- composite index; order matters
CREATE INDEX ON orders (user_id, created_at);
```

## Design choices

A composite index follows the **leftmost-prefix** rule: the index above serves filters on `user_id`, and on `user_id` + `created_at`, but not on `created_at` alone. Put the most selective, most-filtered column first. See [[composite-index|Composite index]].

**Selectivity** decides whether the planner uses an index at all; a column where most rows match (a boolean flag) is a poor index because a sequential scan is cheaper than many random lookups. A **covering index** that includes every column a query needs enables an *index-only scan*, which answers the query from the index without touching the table heap.
