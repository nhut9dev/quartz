---
title: Cursor pagination
description: Paginating through ordered data using a stable cursor instead of an offset.
tags:
  - database
  - web
---

**Cursor pagination** returns a pointer to the next page instead of asking for page number and offset.

The cursor is usually based on a stable ordering column such as creation time plus id.

Compared with offset pagination, it performs better on large datasets and avoids many duplicates or missing rows when new records are inserted.

Cursor pagination is common in feeds, timelines, APIs, and infinite scrolling interfaces.
