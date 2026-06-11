---
title: Strict equality
description: Comparing values with === so JavaScript does not coerce their types first.
tags:
  - javascript
  - basics
  - comparison
---

**Strict equality** uses `===` and compares values without first converting their types.

```js
1 === 1 // true
1 === "1" // false
```

Loose equality, `==`, allows [[type-coercion|type coercion]] before comparing.

```js
1 == "1" // true
0 == false // true
```

Prefer `===` and `!==` unless you have a specific reason to use loose equality. It makes the condition more predictable and forces data conversion to happen explicitly.
