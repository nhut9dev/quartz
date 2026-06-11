---
title: tsconfig
description: The TypeScript project configuration file.
tags:
  - typescript
  - tooling
---

`tsconfig.json` is the TypeScript project configuration file. It tells TypeScript which files belong to the project and how they should be checked or compiled.

```json
{
  "compilerOptions": {
    "target": "ES2022",
    "module": "ESNext",
    "strict": true
  }
}
```

Important options include `target`, `module`, `lib`, `jsx`, `strict`, `baseUrl`, `paths`, and `noEmit`.

Most projects should start from a framework or toolchain default, then tighten options deliberately. The most important long-term setting is usually [[typescript/strict-mode|strict mode]].
