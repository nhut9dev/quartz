---
title: as const
description: A const assertion that makes a value deeply readonly with the narrowest literal types.
tags:
  - typescript
  - type
---

`as const` is a const assertion that tells TypeScript to infer the narrowest possible types for a value and mark it deeply `readonly`. Without it, the compiler widens literals to their base types.

```ts
const a = { role: "admin" } // { role: string }
const b = { role: "admin" } as const // { readonly role: "admin" }

const tuple = [1, 2] as const // readonly [1, 2]
```

This preserves exact [[literal-type|literal types]], which is handy for building unions from an array (`typeof items[number]`) or freezing config objects. Use `as const` when you want a value's literal shape kept intact rather than widened.
