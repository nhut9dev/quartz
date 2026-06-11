---
title: type-only import
description: TypeScript import syntax for types that disappear at runtime.
tags:
  - typescript
  - module
---

A **type-only import** imports a value only for type checking. It disappears from emitted JavaScript.

```ts
import type { User } from "./types"

function renderUser(user: User) {
  return user.name
}
```

Use `import type` when the imported name is only used as a type, not as a runtime value.

This keeps runtime modules cleaner and avoids accidentally creating imports that exist only because TypeScript needed a type.
