---
title: Route handler
description: The function that handles a matched Express route.
tags:
  - express
  - routing
---

A **route handler** is the function that runs when an [[express/route|Express route]] matches the incoming request.

```js
async function getUser(req, res, next) {
  try {
    const user = await users.findById(req.params.userId)
    res.json(user)
  } catch (error) {
    next(error)
  }
}
```

Handlers receive an [[request|Express request]], an [[response|Express response]], and optionally [[next|next()]]. They usually read inputs, call application logic, and send a response.

In bigger codebases, a route handler often delegates to a [[controller|controller]] or service so the HTTP boundary stays thin.
