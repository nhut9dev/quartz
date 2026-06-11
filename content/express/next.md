---
title: next()
description: The Express callback that passes control to the next middleware or error handler.
tags:
  - express
  - middleware
---

`next()` tells Express to continue to the next matching middleware or route handler. Without calling `next()` or sending a response, the request can hang.

```js
function addRequestId(req, res, next) {
  req.requestId = crypto.randomUUID()
  next()
}
```

Passing an error to `next(error)` skips normal handlers and moves to [[error-handling|Express error handling]] middleware.

Use `return` when sending an early response inside middleware. That prevents the function from accidentally continuing and calling `next()` after the response is already sent.
