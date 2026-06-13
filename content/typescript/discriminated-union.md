---
title: Discriminated union
description: A union of object types that share a common tag field.
tags:
  - typescript
  - type
---

A **discriminated union** is a [[union-type|union type]] where each object has a shared tag field with a different [[literal-type|literal type]].

```ts
type Result =
  | { status: "success"; data: User }
  | { status: "error"; message: string }

function render(result: Result) {
  if (result.status === "success") {
    return result.data.name
  }

  return result.message
}
```

Checking the tag narrows the whole object. This is one of the clearest ways to model loading states, API results, form states, and domain workflows.

## How it works

Each member of the union has the same property (`status` here) typed as a distinct [[literal-type|literal]]. When a condition or `switch` compares that property to one of the literals, [[type-narrowing|type narrowing]] doesn't just narrow the tag — it narrows the *entire object* to the matching member, so `result.data` is only visible once `status === "success"` is true. The tag acts as a runtime-checkable proof of which shape you're holding.

## When to use

Use a discriminated union whenever a value can be one of several distinct shapes and the fields that make sense differ per shape — async state (`idle` / `loading` / `success` / `error`), reducer actions, wizard steps, or a parsed API response that can be an error envelope or a data envelope. It's the type-level equivalent of a tagged variant from a language with real sum types.

## Trade-offs

The alternative — one object with several optional fields (`status`, `data?`, `error?`) — lets you represent **impossible states**: `success` with no `data`, or both `data` and `error` set at once. A discriminated union makes those combinations unrepresentable, at the cost of every consumer needing to check the tag before reaching variant-specific fields, even when they "know" which variant they have. That extra narrowing step is the price for the compiler ruling out an entire class of bugs.

## Pitfalls

Adding a new variant doesn't automatically update every `switch`/`if` chain that handles the union — an un-narrowed `default` branch silently falls through. Pair discriminated unions with [[exhaustive-checking|exhaustive checking]] (`default: return assertNever(value)`) so a missing case becomes a compile error instead of a runtime gap. Also watch the discriminant's type: if it's inferred as `string` instead of a literal (common when the value comes from a variable rather than a literal directly in the object), the union collapses and narrowing stops working — annotate or use [[as-const|as const]] to keep it literal.
