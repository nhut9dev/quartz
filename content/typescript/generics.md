---
title: Generics
description: TypeScript type parameters that make types and functions reusable.
tags:
  - typescript
  - type
---

**Generics** let a function, type, or class work with a type provided by the caller, while preserving the relationship between inputs and outputs.

```ts
function first<T>(items: T[]): T | undefined {
  return items[0]
}

const name = first(["Ada", "Grace"]) // T inferred as string
```

## How it works

A type parameter like `T` is a placeholder filled in per use — often inferred from the arguments rather than written explicitly. It keeps types connected: pass `string[]` and the result is `string | undefined`; pass `number[]` and it changes with you. Without the generic you'd fall back to `any` (losing safety) or a union (losing the link between input and output).

## Constraints and defaults

`extends` limits what a parameter can be, which also unlocks property access inside the function. A default (`<T = string>`) supplies a fallback when inference has nothing to go on.

```ts
function prop<T, K extends keyof T>(obj: T, key: K): T[K] {
  return obj[key]
}
```

## Pitfalls

A type parameter that appears in only one position adds no information — it's just `any` in disguise, and the signature is clearer without it. Don't pass type arguments explicitly when inference already gets them right. And over-constraining or nesting many parameters produces signatures nobody can read; reach for generics when the flexibility is real, not by reflex.
