---
title: Express app
description: The main Express object that registers middleware, routes, and server behavior.
tags:
  - express
  - node
---

An **Express app** is the main object returned by calling `express()`. It holds registered [[express/middleware|middleware]], routes, settings, and the server entry point.

```js
const app = express()

app.use(express.json())
app.get("/users", listUsers)
app.listen(3000)
```

The order of `app.use()` and route registration matters. Express checks middleware and routes in the order they were added.

In larger projects, the app often wires infrastructure together while feature-specific paths live in [[router|routers]].
