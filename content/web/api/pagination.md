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

## How it works

A cursor encodes a position in the ordering — typically the sort key (and a tiebreaker like id) of the last item seen, base64-encoded so it's opaque to the client. The next request asks for items after that position. Offset pagination instead sends a literal "skip N rows" count, which the database must scan and discard before returning the page.

## When to use

Offset fits UIs that need to jump to an arbitrary page number or show a total page count — admin tables, search results with page links. Cursor fits feeds, logs, and infinite scroll, where users move forward sequentially and the underlying data changes while they browse.

## Trade-offs

Offset pagination's cost grows with the offset: page 1000 means scanning and discarding 1000×pageSize rows even though none of them are returned, so deep pages get slower as the table grows. Cursor pagination has roughly constant cost per page, but gives up the ability to jump to an arbitrary page or display "page 7 of 42" without a separate count query.

## Pitfalls

With offset pagination, "page drift" happens when rows are inserted or deleted between page requests — an item inserted before the current offset shifts every later row down by one, so the next page either repeats an item or skips one. Cursor pagination avoids this but requires the cursor to be tied to a stable sort: if the sort field is mutable (e.g. sorting by "last updated" while updates are happening), an item's position relative to the cursor can change mid-pagination, causing the same skip-or-repeat problem in a different form.
