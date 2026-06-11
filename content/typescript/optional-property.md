---
title: Optional property
description: An object property that may be missing.
tags:
  - typescript
  - object
---

An **optional property** is an object property that may be missing. TypeScript marks it with `?`.

```ts
type User = {
  id: string
  displayName?: string
}
```

Reading an optional property gives a value that may be `undefined`, so code must handle that case.

```ts
const name = user.displayName ?? "Anonymous"
```

Use optional properties when absence is a valid state. If a value must exist but can be empty, model that directly instead of making the property optional.
