---
title: Pagination
description: Splitting a large collection into smaller pages so responses stay fast and bounded.
tags:
  - web
  - api
  - performance
---

**Pagination** splits a large collection into smaller pages, so a response stays fast and bounded instead of returning everything at once. A list endpoint hands back one slice plus a way to ask for the next.

Common styles: offset/limit (`?offset=40&limit=20`), page number (`?page=3`), and cursor-based, which points at the last item seen and is more stable when data is being inserted or deleted underneath you. In a [[rest|REST]] API these usually ride as query parameters on a `GET` among the [[http-methods|HTTP methods]]. Pagination improves performance and pairs naturally with [[caching|caching]], since each fixed page is easy to store and reuse.

```http
GET /articles?limit=20&cursor=eyJpZCI6MTIzfQ
```

The response usually includes the items plus metadata for continuing.

```json
{
  "items": [],
  "nextCursor": "eyJpZCI6MTQzfQ"
}
```

Offset pagination is simple and good for admin tables. Cursor pagination is better for feeds, logs, and high-write collections because inserting a new row does not shift every later page.
