---
title: Environment variable
description: A value provided by the operating system or deployment environment.
tags:
  - node
  - configuration
---

An **environment variable** is configuration provided outside the source code. Node reads environment variables from `process.env`.

```js
const port = process.env.PORT ?? "3000"
```

Environment variables are commonly used for ports, database URLs, API keys, feature flags, and deployment settings. They help keep deploy-specific values out of committed code.

Secrets should be stored in the deployment platform or secret manager, not hard-coded in the app.
