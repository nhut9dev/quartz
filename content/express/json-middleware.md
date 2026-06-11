---
title: express.json()
description: Express middleware that parses JSON request bodies.
tags:
  - express
  - middleware
---

`express.json()` is built-in [[express/middleware|Express middleware]] that parses JSON [[request-body|request bodies]] and assigns the result to `req.body`.

```js
app.use(express.json())

app.post("/users", (req, res) => {
  res.json({ name: req.body.name })
})
```

Register it before routes that need JSON bodies. Without a body parser, `req.body` will not contain the parsed object.

Parsing JSON is not validation. After parsing, the app still needs to check types, required fields, limits, and permissions.
