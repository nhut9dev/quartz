---
title: Intersection type
description: A TypeScript type that combines multiple types into one.
tags:
  - typescript
  - type
---

An **intersection type** combines multiple types into one type with all their requirements.

```ts
type Identified = { id: string }
type Timestamped = { createdAt: Date }

type Record = Identified & Timestamped
```

A value of `Record` must have both `id` and `createdAt`.

Intersections are useful for composing object capabilities. If the combined result becomes hard to understand, a named [[interface|interface]] or [[type-alias|type alias]] may be clearer.
