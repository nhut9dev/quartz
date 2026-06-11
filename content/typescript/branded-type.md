---
title: Branded type
description: A TypeScript pattern for making structurally identical primitive values distinct.
tags:
  - typescript
---

A **branded type** makes structurally identical values distinct in TypeScript.

It is often used to prevent mixing ids, tokens, currencies, or validated strings that are all represented as `string` or `number` at runtime.

```ts
type UserId = string & { readonly __brand: "UserId" }
type OrderId = string & { readonly __brand: "OrderId" }
```

Brands are a compile-time guard. They do not add runtime validation, so values should be branded only after parsing or checking.
