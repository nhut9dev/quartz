---
title: Conditional type
description: A type that picks one of two types based on whether a relation holds.
tags:
  - typescript
  - type
---

A **conditional type** chooses a type at the type level with the form `T extends U ? X : Y`. If `T` is assignable to `U` the result is `X`, otherwise `Y`.

```ts
type IsString<T> = T extends string ? true : false
type A = IsString<"hi">   // true
type B = IsString<number> // false
```

## Distribution over unions

When the checked type is a *naked* type parameter and you pass a [[union-type|union type]], the conditional **distributes**: it runs over each member and recombines the results into a union. This is powerful but surprising — `NonNullable<string | null>` works because of it, yet it also means a check you expected to run once runs per member.

```ts
type ToArray<T> = T extends any ? T[] : never
type R = ToArray<string | number> // string[] | number[], not (string | number)[]
```

To stop distribution, wrap both sides in a tuple: `[T] extends [U] ? ...`.

## Capturing with infer

Conditional types host [[infer]] to pull a type out of the matched shape — the return type of a function, the element of an array, the resolved value of a promise. Most advanced [[utility-types|utility types]] are built this way.

## Pitfalls

Accidental distribution is the classic bug; reach for the tuple wrap when you mean "the whole union." Deeply nested conditionals quickly become unreadable and slow to type-check — name intermediate types instead of chaining five `extends` in one expression.
