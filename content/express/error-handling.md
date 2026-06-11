---
title: Express error handling
description: Middleware that receives errors and turns them into HTTP responses.
tags:
  - express
  - error
---

**Express error handling** uses special middleware with four parameters: `err`, `req`, `res`, and `next`.

```js
app.use((err, req, res, next) => {
  console.error(err)
  res.status(500).json({ error: "Internal server error" })
})
```

Normal middleware has three parameters. The fourth parameter tells Express this function handles errors.

Route handlers can call [[next|next(error)]] to hand failures to the central error handler. That keeps error response formatting in one place instead of repeating `try...catch` response logic in every handler.
