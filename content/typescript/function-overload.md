---
title: Function overload
description: Multiple call signatures for one function so its return type varies by arguments.
tags:
  - typescript
  - function
---

A **function overload** declares several call signatures above a single implementation, letting the return type depend on which arguments are passed. The implementation signature itself is not callable from outside.

```ts
function len(x: string): number
function len(x: unknown[]): number
function len(x: string | unknown[]): number {
  return x.length
}

const a = len("hi") // number
```

Each overload is matched in order, so the compiler picks the first signature that fits the call. Use overloads when one function genuinely behaves differently by input type and a single signature or a [[union-type|union type]] can't capture the relationship between arguments and result.
