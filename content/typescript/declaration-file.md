---
title: Declaration file
description: A .d.ts file that describes TypeScript types for JavaScript code.
tags:
  - typescript
  - tooling
---

A **declaration file** is a `.d.ts` file that describes types without providing runtime implementation.

```ts
declare function slugify(input: string): string
```

Declaration files let TypeScript understand JavaScript libraries, generated globals, environment variables, and packages that ship separate type information.

They are type contracts only. The real JavaScript must still exist somewhere at runtime, or the program will fail even if TypeScript is satisfied.
