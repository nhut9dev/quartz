---
title: keyof
description: A TypeScript operator that returns the keys of an object type.
tags:
  - typescript
  - type
---

`keyof` creates a union of property names from an object type.

```ts
type User = {
  id: string
  name: string
}

type UserKey = keyof User // "id" | "name"
```

It is often used with [[generics|generics]] to make object helpers type-safe.

```ts
function getValue<T, K extends keyof T>(obj: T, key: K): T[K] {
  return obj[key]
}
```

`keyof` keeps the key and value connected, so asking for `"name"` returns the type of `name`, not just any value.
