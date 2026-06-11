---
title: Express
description: A minimal Node.js web framework for building HTTP servers and APIs.
tags:
  - express
  - node
  - web
---

**Express** is a minimal web framework for [[node-runtime|Node.js]]. It gives you routing, [[express/middleware|middleware]], request and response helpers, and a simple way to build [[http|HTTP]] APIs.

```js
import express from "express"

const app = express()

app.get("/health", (req, res) => {
  res.json({ ok: true })
})

app.listen(3000)
```

Express does not force a project structure. Small apps can keep routes in one file, while larger apps often split work into [[controller|controllers]], routers, services, and middleware.

Use Express when you want a lightweight server with direct control over the request pipeline.
