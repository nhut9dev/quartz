---
title: Type annotation
description: Explicit TypeScript syntax that states the type of a value.
tags:
  - typescript
  - type
---

A **type annotation** explicitly states the type of a variable, parameter, return value, or property.

```ts
const count: number = 3

function formatName(name: string): string {
  return name.trim()
}
```

Annotations are useful at boundaries where TypeScript cannot infer enough from the value, such as function parameters and external data.

Do not annotate everything by habit. When the right side already makes the type obvious, [[type-inference|type inference]] often keeps the code cleaner.
