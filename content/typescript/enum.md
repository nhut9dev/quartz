---
title: enum
description: A named set of related constants, in numeric or string form.
tags:
  - typescript
  - type
---

An `enum` defines a named group of constant values. Numeric enums auto-increment from `0`, while string enums require an explicit value for each member.

```ts
enum Direction { Up, Down } // 0, 1
enum Status { Active = "ACTIVE", Done = "DONE" }
```

Unlike most type constructs, an `enum` emits a real runtime object, so it exists in the compiled JavaScript and adds to bundle size. Numeric enums also allow reverse lookups (`Direction[0] === "Up"`).

## When to use

Reach for `enum` when you want a single named namespace of related constants that also needs to exist at runtime — iterating over all members, reverse-lookup from a numeric value, or passing the enum object itself around. For "this value is one of these exact strings" without needing a runtime object, a union of [[literal-type|literal types]] (`type Status = "ACTIVE" | "DONE"`) is usually the better default, especially for API payloads and React props.

## Trade-offs

A `const enum` is inlined at compile time and produces no runtime object, closing the bundle-size gap with literal unions — but it can't be used across module boundaries under `isolatedModules` (required by most modern bundlers/transpilers that compile files independently), and newer TypeScript toolchains that strip types per-file (e.g. Node's type-stripping mode) reject `enum` entirely. A literal union, by contrast, is purely a compile-time construct: zero runtime cost, works everywhere, but gives you no built-in iteration or reverse mapping — you'd maintain a separate array/object for that.

## Pitfalls

Reordering or inserting members in a **numeric** enum shifts every value after it, which silently breaks any value that was serialized or stored (in a database, localStorage, or an API contract) before the change — string enums avoid this because each member's value is explicit. Mixing an `enum` with external libraries or JSON data that use plain strings often requires casting, since `Status.Active !== "ACTIVE"` as far as the type checker (and sometimes at runtime, depending on enum kind) is concerned without going through the enum's members.
