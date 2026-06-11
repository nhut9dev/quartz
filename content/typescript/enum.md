---
title: enum
description: A named set of related constants, in numeric or string form.
tags:
  - typescript
  - type
---

An `enum` defines a named group of constant values. Numeric enums auto-increment from `0`, while string enums require an explicit value for each member.

```ts
enum Direction { Up, Down } // 0, 1
enum Status { Active = "ACTIVE", Done = "DONE" }
```

Unlike most type constructs, an `enum` emits a real runtime object, so it exists in the compiled JavaScript and adds to bundle size. Numeric enums also allow reverse lookups (`Direction[0] === "Up"`). Many teams prefer a union of [[literal-type|literal types]] (`type Status = "ACTIVE" | "DONE"`) for a lighter, type-only alternative. Reach for `enum` when you want a single named namespace of constants with runtime presence.
