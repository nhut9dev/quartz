---
title: Express Router
description: A mini Express app used to group related routes and middleware.
tags:
  - express
  - routing
---

An **Express Router** groups related routes and middleware into a smaller unit that can be mounted on an app.

```js
const router = express.Router()

router.get("/", listUsers)
router.get("/:userId", getUser)

app.use("/users", router)
```

With that mount path, `router.get("/:userId")` handles `/users/:userId`.

Routers keep the [[app|Express app]] from becoming one long file. They are commonly organized by feature, resource, or API version.
