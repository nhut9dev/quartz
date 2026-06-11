---
title: File system
description: Node.js APIs for reading, writing, and inspecting files.
tags:
  - node
  - file-system
---

The **file system** APIs in Node.js let code read, write, create, delete, and inspect files and directories.

```js
import { readFile } from "node:fs/promises"

const text = await readFile("README.md", "utf8")
```

File system access is useful for CLIs, build tools, uploads, logs, and server-side data processing. It should be handled carefully because paths, permissions, and large files can all cause runtime failures.
