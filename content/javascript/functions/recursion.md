---
title: Recursion
description: A function that solves a problem by calling itself toward a base case.
tags:
  - javascript
  - function
---

**Recursion** is when a function calls itself, breaking a problem into smaller versions of the same problem until it reaches a *base case* that stops the descent. Without a reachable base case, it never terminates.

```js
function factorial(n) {
  if (n <= 1) return 1 // base case
  return n * factorial(n - 1) // recursive case
}

factorial(4) // 24
```

It is a natural fit for nested or branching data — trees, file systems, or deeply nested objects — where each node may contain more nodes of the same shape.

```js
function sum(node) {
  return node.value + node.children.reduce((t, c) => t + sum(c), 0)
}
```

Each call adds a frame to the [[call-stack|call stack]], so very deep recursion can overflow it with a "Maximum call stack size exceeded" error. When depth is unbounded, an explicit loop or stack is safer.
