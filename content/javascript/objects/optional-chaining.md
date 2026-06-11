---
title: Optional chaining
description: Safely access nested properties without throwing on null or undefined.
tags:
  - javascript
  - operator
---

**Optional chaining** (`?.`) reads a nested property only if the value before it is not `null` or `undefined`. If it is, the whole expression short-circuits to `undefined` instead of throwing a `TypeError`.

```js
const user = { profile: { name: "Nhut" } }

user.profile?.name // "Nhut"
user.account?.id // undefined, no error
user.save?.() // calls save only if it exists
```

This replaces long guard chains like `user && user.profile && user.profile.name`. It works on property access, indexing (`arr?.[0]`), and method calls (`obj?.fn()`).

Note that `?.` only protects against `null`/`undefined`, not other missing-ish values. Pair it with [[nullish-coalescing|nullish coalescing]] to supply a fallback: `user.account?.id ?? "guest"`.

Use it when reaching into data whose shape may be partial, such as API responses.
