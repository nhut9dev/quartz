---
title: satisfies
description: An operator that checks a value against a type while keeping its narrow inferred type.
tags:
  - typescript
  - type
---

`satisfies` verifies that a value conforms to a type without widening the value to that type. A plain annotation would replace the value's specific inferred type with the broader declared one; `satisfies` keeps the narrow type and still reports mismatches.

```ts
const config = {
  port: 3000,
  host: "localhost",
} satisfies Record<string, string | number>

config.host.toUpperCase() // host is still string, not string | number
```

Unlike a [[type-assertion|type assertion]], `satisfies` never lies: the value must actually match the type or you get an error. Use it when you want a value validated against a contract but still want to access its exact members afterward.
