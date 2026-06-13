---
title: Cursor pagination
description: Paginating through ordered data using a stable cursor instead of an offset.
tags:
  - database
  - web
---

**Cursor pagination** (keyset pagination) returns each page along with a **cursor** pointing at where to continue, so the next page is fetched relative to the last row seen rather than by a numeric offset.

## How it works

Instead of "skip 2000 rows, give me the next 20," the query says "give me 20 rows *after this value*." The cursor encodes the ordering position of the last row returned — typically a stable, unique ordering key like `(created_at, id)`:

```sql
SELECT * FROM posts
WHERE (created_at, id) < (:last_created_at, :last_id)  -- the cursor
ORDER BY created_at DESC, id DESC
LIMIT 20;
```

With an index on the ordering columns, the database **seeks** directly to the cursor position and reads 20 rows — no matter how deep into the dataset you are.

## Compared to offset pagination

`OFFSET 2000 LIMIT 20` makes the database generate and *discard* the first 2000 rows to return 20, so cost grows linearly with depth — page 1000 is far slower than page 1. Cursor pagination's cost is constant regardless of depth. Offset also suffers **drift**: if a row is inserted or deleted while a user pages, the offset shifts, causing rows to be skipped or shown twice. A cursor anchored to a stable key is immune — it always continues from a real row, so a feed where new items arrive at the top stays correct.

## Pitfalls

The ordering key **must be unique and stable**, or rows tie at the boundary and get skipped or duplicated — that's why `created_at` alone is unsafe (timestamps collide) and is paired with `id` as a tiebreaker. Cursor pagination also gives up **random access**: you can't jump to "page 50" or show numbered pages, only next/previous, which is fine for infinite scroll and feeds but wrong for a UI that needs page numbers. And the ordering in the query must exactly match the cursor's columns and direction, or the seek returns wrong results. It's the standard choice for feeds, timelines, and [[../product-engineering/infinite-scroll|infinite scroll]].
