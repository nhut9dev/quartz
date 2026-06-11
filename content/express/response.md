---
title: Express response
description: The object used to send an HTTP response from Express.
tags:
  - express
  - response
---

The **Express response** object, usually named `res`, sends the [[http|HTTP]] response back to the client.

```js
app.post("/users", async (req, res) => {
  const user = await createUser(req.body)
  res.status(201).json(user)
})
```

Common methods include `res.status()`, `res.json()`, `res.send()`, `res.redirect()`, and `res.set()`.

Send one response per request. After calling `res.json()` or `res.send()`, avoid continuing into code that might send again or call [[next|next()]] incorrectly.
