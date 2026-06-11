---
title: Interface
description: A TypeScript declaration for the shape of an object.
tags:
  - typescript
  - object
---

An **interface** describes the shape of an object.

```ts
interface User {
  id: string
  name: string
}
```

Interfaces are commonly used for public object contracts: props, API DTOs, service inputs, and class shapes.

Compared with a [[type-alias|type alias]], an interface is focused on object shapes and can be extended or merged. For unions, primitives, tuples, and mapped types, use a type alias.
