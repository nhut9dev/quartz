---
title: Pagination strategy
description: A way to split large API result sets into smaller pages.
tags:
  - api
  - database
---

A **pagination strategy** defines how an API returns large result sets in smaller chunks.

Offset pagination is simple and works well for small, stable lists, but it can become slow or inconsistent when rows are inserted or deleted.

Cursor pagination uses a stable position, often based on an indexed column such as created time plus id. It is better for feeds, logs, and high-volume lists.

Pagination design is tied to [[../database/cursor-pagination|cursor pagination]], [[../database/database-index|database indexes]], sorting rules, and the client UX.
