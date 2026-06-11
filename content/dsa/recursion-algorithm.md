---
title: Recursion
description: Solving a problem by having a function call itself on smaller subproblems.
tags:
  - dsa
  - algorithm
---

**Recursion** solves a problem by having a function call itself on smaller subproblems.

```js
function factorial(n) {
  if (n <= 1) return 1
  return n * factorial(n - 1)
}
```

Every recursive solution needs a base case that stops the calls. Without one, the function keeps calling itself until the [[../javascript/call-stack|call stack]] overflows.

Recursion is a natural fit for [[tree|trees]], nested data, divide-and-conquer algorithms, and backtracking.
