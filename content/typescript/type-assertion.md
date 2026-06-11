---
title: Type assertion
description: A way to tell the compiler to treat a value as a specific type.
tags:
  - typescript
  - type
---

A **type assertion** uses `value as Type` to override the compiler's inferred type. It is a compile-time instruction only — there is no runtime check or conversion.

```ts
const el = document.getElementById("app") as HTMLInputElement
el.value = "hi" // trusted, but not verified at runtime
```

## How it works

The compiler simply takes your word for it and stops checking that expression against its real type. Assertions are also restricted: TypeScript only lets you assert between types that overlap, which is why forcing an unrelated type often requires the `as unknown as Target` double step — a strong sign you're working around the type system, not with it.

## Assertion vs satisfies vs guards

A [[type-guard|type guard]] *checks* the value at runtime and narrows it safely. [[satisfies|satisfies]] *validates* that a value matches a type without widening or overriding it. An assertion does neither — it only relabels. Prefer a guard when the type must actually be confirmed, and `satisfies` when you want checking without losing the literal type.

## Pitfalls

Because nothing is validated, a wrong assertion silently hides a real bug until it explodes at runtime — `as` on parsed JSON or an API response trusts data you don't control. The non-null assertion `!` has the same danger in miniature. And assertions drift: when the underlying shape changes, the compiler won't flag the now-incorrect `as`. Reach for one only when you genuinely know more than the compiler, such as a DOM lookup you control.
