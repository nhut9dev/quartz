---
title: Type inference
description: TypeScript's ability to figure out types from code.
tags:
  - typescript
  - type
---

**Type inference** is TypeScript's ability to figure out a type from the code you wrote.

```ts
const name = "Ada" // string
const count = 3 // number
const active = true // boolean
```

Inference works best when values are created close to where they are used. It reduces noise because the type checker already knows the obvious parts.

Use explicit [[type-annotation|type annotations]] when inference would be too broad, too narrow, or unclear to the next person reading the code.
