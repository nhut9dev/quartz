---
title: Query params
description: Key-value values attached to a URL after a question mark.
tags:
  - web
  - http
  - api
---

**Query params** are key-value values attached to a URL after `?`. They are commonly used for filters, sorting, search terms, and [[pagination|pagination]].

```http
GET /products?category=books&limit=20&page=2
```

Query params are part of the URL, so they are easy to bookmark, share, cache, and inspect in logs. They are a good fit for read options on `GET` endpoints.

Use a [[request-body|request body]] instead when the input is large, sensitive, or describes a state-changing command.
