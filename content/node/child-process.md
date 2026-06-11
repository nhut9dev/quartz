---
title: Child process
description: A separate operating system process started from Node.js.
tags:
  - node
---

A **child process** lets Node.js run another program outside the current JavaScript process.

Common uses include running CLI tools, image processors, shell commands, test runners, and build tools.

```js
import { spawn } from "node:child_process"

const child = spawn("node", ["--version"])
```

Prefer structured APIs when they exist. Child processes add overhead and require careful handling of arguments, exit codes, stdout, stderr, and untrusted input.
