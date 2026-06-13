---
title: N+1 problem
description: A query pattern where one initial query triggers many additional queries.
tags:
  - database
---

The **N+1 problem** is a query pattern where loading a list costs one query for the list plus one more query *per item* — N+1 round trips where one or two would do.

## How it happens

Load 50 posts (1 query), then access each post's author, and an [[orm|ORM]] silently fires a separate `SELECT author WHERE id = ?` for each — 50 more queries, 51 total. The trap is that the code looks innocent: a loop over `posts` accessing `post.author` reads like plain property access, but each access is a hidden database round trip. **Lazy-loaded relationships** are the usual culprit, because the cost is invisible at the call site — nothing in the code says "this is a query."

The damage is the round trips, not the data volume. Even if each query is fast, 51 network round trips to the database dominate, and the pattern gets linearly worse as the list grows — fine with 10 rows in dev, catastrophic with 10,000 in production.

## Fixes

- **Eager loading / joins** — fetch posts and their authors together in one query (an ORM's `include`/`join`/`with`).
- **Batching** — collect the needed author IDs and fetch them all in one `WHERE id IN (...)` query (the pattern behind [[../web/api/dataloader|DataLoader]]).
- **Query for the screen** — shape the query around exactly the data the page or endpoint needs, rather than navigating object relationships row by row.

## Pitfalls

It hides easily — tests on small datasets pass, and the ORM emits no warning — so it's usually found only when production slows down; catching it means watching the *query count* per request, not just per-query latency. The opposite over-correction also bites: an over-eager `join` that pulls deep relationship trees fetches far more data than the screen uses, trading N+1 for one enormous slow query. Confirm the fix with a [[query-plan|query plan]] and a query-count check, not by assuming eager loading is always better.
