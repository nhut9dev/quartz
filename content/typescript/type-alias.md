---
title: Type alias
description: A TypeScript name for any type expression.
tags:
  - typescript
  - type
---

A **type alias** gives a name to a type expression.

```ts
type UserId = string
type Status = "idle" | "loading" | "success"
type User = { id: UserId; name: string }
```

Type aliases can name primitives, objects, [[union-type|unions]], intersections, tuples, functions, and utility type results.

Use [[interface|interfaces]] for extendable object contracts when that reads better. Use type aliases when the type is not just an object shape.
