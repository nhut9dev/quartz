---
title: Exhaustive checking
description: Making TypeScript verify that every case in a union has been handled.
tags:
  - typescript
---

**Exhaustive checking** makes TypeScript verify that every case in a union has been handled.

It is most useful with [[discriminated-union|discriminated unions]], reducers, state machines, and API result types.

```ts
function assertNever(value: never): never {
  throw new Error(`Unexpected value: ${value}`)
}
```

When a new union member is added, the unhandled branch no longer narrows to `never`, so TypeScript reports the missing case.
