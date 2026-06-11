---
title: HTTP headers
description: Key-value metadata attached to a request or response.
tags:
  - web
  - http
---

**HTTP headers** are key-value metadata attached to a request or response, describing everything about a message except its body. Common ones include `Content-Type` (the body's media type, e.g. `application/json`), `Authorization` (credentials such as a [[jwt|bearer token]]), `Accept` (formats the client will take), `Cache-Control` (drives [[caching|caching]]), and `Set-Cookie`.

```http
Content-Type: application/json
Authorization: Bearer eyJhbGciOi...
```

Because headers carry intent and context separately from the payload, the same body can be served, secured, or cached differently just by changing them — a key reason [[http|HTTP]] is so flexible.
