---
title: any, unknown, and never
description: Special TypeScript types for unsafe, untrusted, and impossible values.
tags:
  - typescript
  - type
---

`any`, `unknown`, and `never` are special TypeScript types with very different meanings.

```ts
let unsafe: any
let input: unknown
let impossible: never
```

`any` turns off type checking for a value. `unknown` means the value exists but must be checked before use. `never` means a value cannot exist, often after exhaustive checks or functions that always throw.

Prefer `unknown` over `any` at external boundaries. It forces [[type-narrowing|narrowing]] before the value is treated as a string, object, number, or other specific type.
