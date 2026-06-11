---
title: HTTP server
description: A Node.js server that accepts HTTP requests and sends HTTP responses.
tags:
  - node
  - web
---

An **HTTP server** listens for requests and writes responses.

```js
import http from "node:http"

const server = http.createServer((req, res) => {
  res.statusCode = 200
  res.end("OK")
})

server.listen(3000)
```

Frameworks like [[../express/introduction|Express]] build on this idea. They add routing, middleware, error handling, and request parsing so application code stays organized.
