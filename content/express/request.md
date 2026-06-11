---
title: Express request
description: The object that represents the incoming HTTP request in Express.
tags:
  - express
  - request
---

The **Express request** object, usually named `req`, represents the incoming [[http|HTTP]] request. It exposes route params, query params, headers, cookies, and parsed body data.

```js
app.get("/users/:userId", (req, res) => {
  const id = req.params.userId
  const includePosts = req.query.includePosts === "true"
})
```

Common properties include `req.params`, `req.query`, `req.body`, `req.headers`, and `req.cookies` when cookie middleware is installed.

The request object is read-heavy. Application code usually reads input from it, validates that input, then passes clean values to a [[service-layer|service layer]].
