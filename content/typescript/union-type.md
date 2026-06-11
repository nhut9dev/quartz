---
title: Union type
description: A TypeScript type that allows one of several possible types.
tags:
  - typescript
  - type
---

A **union type** allows a value to be one of several possible types.

```ts
type Status = "idle" | "loading" | "success" | "error"

let status: Status = "idle"
```

Unions are useful when a value has a limited set of valid shapes or states.

Before using members that exist on only one side of a union, TypeScript needs [[type-narrowing|type narrowing]] so it knows which case the code is handling.
