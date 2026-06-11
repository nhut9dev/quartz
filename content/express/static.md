---
title: express.static()
description: Express middleware for serving static files from a directory.
tags:
  - express
  - middleware
---

`express.static()` serves files from a directory through Express.

```js
app.use("/assets", express.static("public"))
```

With that setup, a file at `public/logo.png` can be served from `/assets/logo.png`.

It is useful for small apps, local development, and simple deployments. At larger scale, static files are often served by a [[reverse-proxy|reverse proxy]] or [[cdn|CDN]] so the Node process can focus on dynamic API work.
