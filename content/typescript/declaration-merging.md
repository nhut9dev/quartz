---
title: Declaration merging
description: Combining multiple declarations of the same name into a single definition.
tags:
  - typescript
  - type
---

**Declaration merging** happens when two or more declarations share a name and TypeScript folds them into one. Two [[interface|interfaces]] with the same name merge their members, which is how libraries let you extend existing types.

```ts
interface Window { theme: string }
interface Window { locale: string }
// Window now has both theme and locale

namespace App { export const version = "1" }
interface App { name: string }
// interface + namespace merge
```

This works for interfaces, namespaces, enums, and certain combinations like a function plus a namespace. A [[type-alias|type alias]] cannot be merged this way. Use declaration merging to augment third-party types or attach static members to a function.
