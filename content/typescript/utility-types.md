---
title: Utility types
description: Built-in TypeScript helpers that transform existing types.
tags:
  - typescript
  - type
---

**Utility types** are built-in helpers that transform existing types into new ones.

```ts
type User = {
  id: string
  name: string
  email: string
}

type UserPreview = Pick<User, "id" | "name">
type UserUpdate = Partial<User>
```

Common utilities include `Partial`, `Required`, `Pick`, `Omit`, `Record`, `ReturnType`, and `Parameters`.

Utility types reduce duplication. Instead of manually copying a shape, derive a related shape from the source type so changes stay connected.
