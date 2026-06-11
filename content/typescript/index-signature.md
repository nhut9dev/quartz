---
title: Index signature
description: A TypeScript object type for dynamic property keys.
tags:
  - typescript
  - object
---

An **index signature** describes an object with dynamic keys.

```ts
type Scores = {
  [userId: string]: number
}
```

This means every string key maps to a number value.

Use index signatures when the set of keys is not known ahead of time. If the keys are known, a normal object type or [[utility-types|Record]] with a [[union-type|union]] of keys is usually stricter.
