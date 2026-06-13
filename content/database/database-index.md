---
title: Database index
description: A data structure that helps a database find rows faster.
tags:
  - database
  - performance
---

A **database index** is an auxiliary data structure that lets the database locate matching rows without scanning the whole table — the single most important tool for read performance.

```sql
CREATE INDEX users_email_idx ON users (email);
```

## How it works

Without an index, finding rows where `email = ?` means a **sequential scan**: read every row and check. An index keeps the indexed column's values in a sorted structure — almost always a [[index-internals|B-tree]] — that the database can search in logarithmic time, then follow a pointer to the actual row. Because the B-tree keeps keys ordered, one index accelerates equality (`=`), ranges (`<`, `BETWEEN`), prefix matches (`LIKE 'foo%'`), and `ORDER BY` on the same column — not just exact lookups.

## The read/write trade-off

An index is a *copy* of data that the database must keep in sync. Every `INSERT`, `UPDATE`, or `DELETE` to an indexed column also updates the index, so indexes make reads faster but writes slower, and each one consumes storage. This is the central tension: indexes aren't free, so they're justified per query pattern, not added by default to every column.

## Pitfalls

The most common mistake is **indexing by guess** rather than by measured query patterns — under-indexing leaves slow sequential scans, while over-indexing taxes every write and wastes space on indexes the planner never uses. A low-**selectivity** index (on a boolean, a status with three values) often goes unused because scanning is cheaper than many random row fetches when most rows match. And the planner can only use an index if the query is **sargable** — wrapping the column in a function (`WHERE lower(email) = ?`) or leading a `LIKE` with `%` defeats it. Confirm an index is actually used with a [[query-plan|query plan]] / [[explain-analyze|EXPLAIN ANALYZE]] rather than assuming.
