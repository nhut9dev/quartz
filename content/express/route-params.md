---
title: Express route params
description: Dynamic values captured from an Express route path.
tags:
  - express
  - routing
---

**Express route params** are dynamic values captured from a route path and exposed on `req.params`.

```js
app.get("/users/:userId/posts/:postId", (req, res) => {
  const { userId, postId } = req.params
})
```

Route params identify path-based resources, such as a user ID or post ID. They are part of the route shape, not optional filters.

Use [[query|query]] values for optional search, filtering, sorting, and [[pagination|pagination]] controls.
