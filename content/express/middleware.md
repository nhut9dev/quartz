---
title: Express middleware
description: Functions that run in the Express request pipeline before a response is finished.
tags:
  - express
  - middleware
---

**Express middleware** is a function that runs during the request pipeline. It can read or change the request, send a response, or pass control onward with [[next|next()]].

```js
function requireAuth(req, res, next) {
  if (!req.user) {
    return res.status(401).json({ error: "Unauthorized" })
  }

  next()
}
```

Middleware is Express's version of the broader web [[express/middleware|middleware]] pattern. It is useful for logging, auth, parsing, validation, static files, and error handling.

Order matters. Middleware registered before a route can affect that route; middleware registered after it cannot.
