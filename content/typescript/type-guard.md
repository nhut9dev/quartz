---
title: Type guard
description: A runtime check that helps TypeScript narrow a type.
tags:
  - typescript
  - type
---

A **type guard** is a runtime check that lets TypeScript narrow a value to a more specific type.

```ts
function isUser(value: unknown): value is User {
  return typeof value === "object" && value !== null && "id" in value
}

if (isUser(input)) {
  console.log(input.id)
}
```

The `value is User` return type tells TypeScript that `input` is a `User` when the function returns true.

Type guards are useful at boundaries where data starts as [[any-unknown-never|unknown]], such as JSON responses, local storage, or incoming request bodies.
