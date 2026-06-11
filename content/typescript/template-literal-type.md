---
title: Template literal type
description: A string literal type built by interpolating other types into a template.
tags:
  - typescript
  - type
---

A **template literal type** uses backtick syntax at the type level to compose new string [[literal-type|literal types]] from interpolated parts.

```ts
type Method = "GET" | "POST"
type Path = "/users" | "/posts"
type Route = `${Method} ${Path}`
// "GET /users" | "GET /posts" | "POST /users" | "POST /posts"
```

When any interpolated slot is a [[union-type|union type]], TypeScript expands the template across every combination. Built-in helpers like `Uppercase` and `Capitalize` can transform the pieces. Use template literal types to model structured strings such as event names, CSS units, or API routes with full type safety.
