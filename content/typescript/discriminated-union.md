---
title: Discriminated union
description: A union of object types that share a common tag field.
tags:
  - typescript
  - type
---

A **discriminated union** is a [[union-type|union type]] where each object has a shared tag field with a different [[literal-type|literal type]].

```ts
type Result =
  | { status: "success"; data: User }
  | { status: "error"; message: string }

function render(result: Result) {
  if (result.status === "success") {
    return result.data.name
  }

  return result.message
}
```

Checking the tag narrows the whole object. This is one of the clearest ways to model loading states, API results, form states, and domain workflows.
