---
title: Fetch API
description: The browser API for making HTTP requests from JavaScript.
tags:
  - javascript
  - web
  - api
---

The **Fetch API** is the standard browser API for making [[http|HTTP]] requests. It returns a [[promise|promise]] that resolves to a `Response` object.

```js
const response = await fetch("/api/users")

if (!response.ok) {
  throw new Error("Request failed")
}

const users = await response.json()
```

`fetch` only rejects for network-level failures. A `404` or `500` response still resolves, so application code usually checks `response.ok` before reading the body.

Fetch is low-level. React apps often wrap it with a data layer like [[tanstack-query|TanStack Query]] when they need caching, retries, loading states, and mutation invalidation.
