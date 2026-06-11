---
title: Type narrowing
description: Refining a broad TypeScript type to a more specific type.
tags:
  - typescript
  - type
---

**Type narrowing** refines a broad type into a more specific type inside a control-flow branch, so code can safely work with [[union-type|union types]] and [[any-unknown-never|unknown]] values without giving up type safety.

```ts
function format(value: string | number) {
  if (typeof value === "string") return value.toUpperCase()
  return value.toFixed(2) // value is number here
}
```

## How it works

TypeScript runs *control-flow analysis*: each branch tracks what must be true to reach it and narrows accordingly. The built-in narrowers are `typeof`, `instanceof`, the `in` operator, truthiness checks, and equality against a [[literal-type|literal]] or the discriminant of a [[discriminated-union|discriminated union]]. For checks the compiler can't see through, a [[type-guard|type guard]] returning a [[type-predicate|type predicate]] (`x is Cat`) teaches it your custom narrowing.

## Pitfalls

Narrowing is tied to a binding's control flow, and it can be **lost**. After an `await`, inside a later callback, or across a closure, TypeScript assumes the value might have changed and widens it back — re-check, or capture the narrowed value in a `const`. Narrowing a `let` that gets reassigned also resets. And narrowing a property access (`obj.x`) is fragile: a function call in between can invalidate it, so pull the value into a local first.
