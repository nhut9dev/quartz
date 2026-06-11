---
title: Literal type
description: A TypeScript type for one exact value.
tags:
  - typescript
  - type
---

A **literal type** represents one exact value, not the wider primitive type.

```ts
type Method = "GET" | "POST" | "PATCH" | "DELETE"
type RetryCount = 0 | 1 | 2 | 3
```

Literal types are often combined into [[union-type|union types]] to model allowed states, variants, methods, roles, and commands.

They make invalid strings impossible at compile time. Instead of accepting any `string`, a function can accept only the exact values it understands.
