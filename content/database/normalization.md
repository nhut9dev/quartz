---
title: Normalization
description: A database design approach that reduces duplicated and inconsistent data.
tags:
  - database
---

**Normalization** organizes a schema so each fact lives in exactly one place, eliminating the duplicated data that lets records drift out of sync.

## How it works

The core move is to factor repeating data into its own table and reference it by [[foreign-key|foreign key]]. Instead of copying a user's email onto every order row, you keep one `users` row and store `user_id` on each order. Now the email exists once: updating it is a single write, and there's no way for two orders to disagree about it.

Formally this proceeds through *normal forms* — 1NF (atomic columns, no repeating groups), 2NF and 3NF (every non-key column depends on the whole key and nothing but the key). In practice "normalized" usually means roughly 3NF: no column stores data that belongs to a different entity.

## Why it matters

The payoff is **update integrity**. Duplicated data creates *update anomalies* — change the email in one of fifty order rows and the other forty-nine are now wrong, with no error to flag it. Normalization makes such inconsistency structurally impossible, because there's only one copy to update. It also shrinks storage and makes the schema's intent legible: each table is one clear concept.

## The denormalization trade-off

Normalization optimizes writes and correctness at the cost of reads: reassembling data spread across tables requires [[join|joins]], and a heavily normalized schema can need many joins for one query. So performance-sensitive read paths sometimes **denormalize** — deliberately duplicate data (a cached `user_email` on orders, a [[materialized-view|materialized view]]) to avoid the join. The catch is that you've reintroduced the consistency problem and now own keeping the copies in sync. The sound default is to normalize first and denormalize *selectively*, with evidence, not to start denormalized.

## Pitfalls

Over-normalizing tiny lookup data (splitting out a table for a two-value enum) adds joins for no integrity benefit. Denormalizing *before* you have a measured read problem trades guaranteed correctness for speculative speed — and the stale-copy bugs that follow are subtle and hard to trace. And denormalized duplicates need a disciplined update path (triggers, application logic, or a refresh job), or they silently diverge from the source of truth.
