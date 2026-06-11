---
title: path module
description: Node.js utilities for safely working with filesystem paths.
tags:
  - node
---

The `path` module provides helpers for building and reading file paths.

```js
import path from "node:path"

const file = path.join(process.cwd(), "data", "users.json")
```

It handles platform differences such as path separators.

Use it instead of manually concatenating path strings, especially in tools that may run on different operating systems.
