---
title: Nullish coalescing
description: Provide a fallback value only when the left side is null or undefined.
tags:
  - javascript
  - operator
---

The **nullish coalescing** operator (`??`) returns its right-hand value only when the left side is `null` or `undefined`. Every other value, including `0`, `""`, and `false`, passes through unchanged.

```js
const count = 0

count ?? 10 // 0
count || 10 // 10
```

This is the key difference from `||`, which falls back on any [[truthy-falsy|falsy]] value. When `0` or an empty string are valid inputs, `||` would wrongly discard them, while `??` preserves them.

```js
const port = config.port ?? 3000
```

It pairs naturally with [[optional-chaining|optional chaining]] to read a possibly-missing property and supply a default in one expression.

Use `??` when only `null`/`undefined` should trigger the default, and `||` when any falsy value should.
