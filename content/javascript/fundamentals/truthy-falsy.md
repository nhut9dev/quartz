---
title: Truthy and falsy
description: How JavaScript converts values to booleans in conditions.
tags:
  - javascript
  - basics
---

**Truthy** and **falsy** describe how JavaScript treats any value in a boolean context. Conditions don't require actual booleans — they first coerce the value, so every value is either truthy or falsy.

```js
Boolean("") // false
Boolean("hello") // true
Boolean(0) // false
Boolean(1) // true
```

The falsy values are `false`, `0`, `-0`, `0n`, `""`, `null`, `undefined`, and `NaN`. Everything else is truthy, including empty arrays and empty objects.

```js
if ([]) {
  console.log("arrays are truthy")
}
```

Truthy and falsy checks are convenient, but be careful when `0`, an empty string, or `false` are valid values. In those cases, an explicit comparison is clearer.
