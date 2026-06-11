---
title: TypeScript
description: JavaScript with a static type system checked before runtime.
tags:
  - typescript
  - javascript
---

**TypeScript** is JavaScript with a static type system. It checks types before code runs, then compiles away to plain JavaScript for the [[javascript-runtime|JavaScript runtime]].

```ts
function greet(name: string) {
  return `Hello, ${name}`
}
```

TypeScript helps catch mistakes like missing properties, wrong argument types, impossible branches, and unsafe assumptions about data shape.

It does not change runtime behavior by itself. After compilation, the type annotations are gone, so external data still needs validation at boundaries such as APIs, forms, and files.
