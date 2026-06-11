---
title: process
description: The Node.js global object that exposes information about the current process.
tags:
  - node
---

`process` is a Node.js global object that exposes information and controls for the current program.

```js
console.log(process.env.NODE_ENV)
console.log(process.argv)
```

Common uses include reading [[environment-variable|environment variables]], inspecting command-line arguments, setting exit codes, and reacting to shutdown signals.

Because `process` is Node-specific, browser code should not depend on it directly.
