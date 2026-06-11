---
title: Zod
description: A TypeScript-first schema validation library often used with React forms.
tags:
  - react
  - form
  - validation
  - library
---

**Zod** defines schemas that validate unknown data at runtime and infer TypeScript types from those schemas.

```ts
const loginSchema = z.object({
  email: z.string().email(),
  password: z.string().min(8),
})
```

In React apps, Zod is commonly used with [[react-hook-form|React Hook Form]], [[tanstack-form|TanStack Form]], API validation, and route input parsing.

It is especially useful at boundaries: form input, URL params, local storage, API responses, and environment variables.
