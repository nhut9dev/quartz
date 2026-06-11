---
title: Variance
description: How subtype relationships behave when types are nested inside other types.
tags:
  - typescript
  - type
---

**Variance** describes how subtype relationships behave when types are nested inside other types. If `Dog` is a subtype of `Animal`, variance asks whether `Box<Dog>` is usable where `Box<Animal>` is expected.

## Covariance and contravariance

Outputs are **covariant**: a function returning `Dog` is assignable where one returning `Animal` is expected, because every `Dog` is an `Animal`. Inputs are **contravariant**: a handler that accepts any `Animal` is safely usable where an `Animal`-or-narrower handler is expected, because it can cope with whatever it's given. This flip is why a `(a: Animal) => void` can stand in for a `(d: Dog) => void`, but not the reverse — a `Dog`-only handler would break if handed a `Cat`.

## Where it bites

It shows up in callbacks, event handlers, and generic containers. TypeScript checks function parameters contravariantly only under `strictFunctionTypes` (set via [[tsconfig|tsconfig]]). Crucially, **methods are checked bivariantly** as a deliberate practicality hole, and arrays are treated covariantly even though mutation makes that technically unsound:

```ts
const dogs: Dog[] = []
const animals: Animal[] = dogs // allowed (covariant)...
animals.push(new Cat())        // ...but this corrupts dogs at runtime
```

## Pitfalls

Don't rely on array/method variance for safety — it's a convenience TypeScript chose, not a guarantee. When you need a parameter checked strictly, write it as a function-typed property rather than a method. And when a generic assignment is unexpectedly accepted or rejected, variance is usually the reason.
