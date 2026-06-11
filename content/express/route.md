---
title: Express route
description: A method and path pair that maps an HTTP request to handlers.
tags:
  - express
  - routing
---

An **Express route** maps an [[http-methods|HTTP method]] and path pattern to one or more handlers.

```js
app.get("/users/:userId", getUser)
app.post("/users", createUser)
```

The path can include static segments and route params. When a request matches both the method and path, Express runs the attached [[express/route-handler|route handler]] or middleware chain.

An Express route is an implementation of a web [[endpoint|endpoint]]. The endpoint is the public API shape; the route is how Express connects that shape to code.
