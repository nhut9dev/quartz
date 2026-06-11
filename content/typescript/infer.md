---
title: infer
description: A keyword that captures a type from inside a conditional type's pattern.
tags:
  - typescript
  - type
---

`infer` declares a temporary type variable inside the `extends` clause of a [[conditional-type|conditional type]], letting you pull a piece out of a larger type when it matches.

```ts
type ReturnOf<T> = T extends (...args: any[]) => infer R ? R : never

type Fn = () => number
type R = ReturnOf<Fn> // number
```

Here `infer R` matches whatever a function returns and binds it to `R`, which the true branch then uses. The same trick extracts element types from arrays, awaited types from promises, and more. Reach for `infer` when you need to destructure a type and reuse one of its inner parts.
