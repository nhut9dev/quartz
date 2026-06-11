---
title: Express query
description: Query string values parsed from the request URL in Express.
tags:
  - express
  - request
---

**Express query** values come from the URL query string and are exposed on `req.query`.

```js
app.get("/products", (req, res) => {
  const { category, page = "1" } = req.query
})
```

Query values are useful for optional filters, search terms, sorting, and [[pagination|pagination]]. They map directly to the broader web idea of [[query-params|query params]].

Treat query values as untrusted strings until validated. Even values that look numeric arrive from the URL, not from typed application code.
