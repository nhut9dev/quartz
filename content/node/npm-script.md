---
title: npm script
description: A named command stored in package.json.
tags:
  - node
  - npm
---

An **npm script** is a named command in the `scripts` section of [[package-json|package.json]].

```json
{
  "scripts": {
    "dev": "vite",
    "build": "vite build",
    "test": "jest"
  }
}
```

Scripts create a shared vocabulary for a project. Instead of remembering tool-specific commands, developers can run `npm run dev`, `npm run build`, or `npm test`.
