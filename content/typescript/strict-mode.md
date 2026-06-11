---
title: strict mode
description: A TypeScript compiler setting that enables stricter type checking.
tags:
  - typescript
  - tooling
---

TypeScript **strict mode** enables a group of stricter compiler checks through `"strict": true` in [[tsconfig|tsconfig]].

```json
{
  "compilerOptions": {
    "strict": true
  }
}
```

Strict mode catches more unsafe code, especially around `null`, `undefined`, implicit `any`, function variance, and class initialization.

It can require more explicit modeling, but that cost usually pays back through better editor feedback and fewer runtime surprises.
