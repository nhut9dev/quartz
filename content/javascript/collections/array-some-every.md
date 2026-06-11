---
title: Array.prototype.some() and every()
description: Boolean tests that check whether some or all elements pass a predicate.
tags:
  - javascript
  - array
  - array-method
---

`some()` and `every()` reduce an array to a single boolean. `some` returns `true` when **at least one** element passes your test; `every` returns `true` only when **all** of them do.

```js
const numbers = [2, 4, 6]

numbers.some(n => n % 2 === 1) // false — none are odd
numbers.every(n => n % 2 === 0) // true — all are even
```

Both stop as soon as the answer is settled: `some` returns `true` on the first match, `every` returns `false` on the first failure. On an empty array, `some` is `false` and `every` is `true` (vacuously).

```js
users.some(u => u.isAdmin) // any admin?
users.every(u => u.active) // all active?
```

Use `some` to ask "is there any…?" and `every` to ask "are they all…?" — when you want a yes/no answer rather than the matching elements.
