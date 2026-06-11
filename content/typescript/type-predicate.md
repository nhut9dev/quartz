---
title: Type predicate
description: A TypeScript return type that tells the compiler a value has been narrowed.
tags:
  - typescript
---

A **type predicate** is a return type that tells TypeScript a function narrows a value.

```ts
function isString(value: unknown): value is string {
  return typeof value === "string"
}
```

Type predicates are useful when runtime checks live in reusable helper functions.

They should match the real runtime check. If a predicate lies, TypeScript will trust it and unsafe code can pass the compiler.
