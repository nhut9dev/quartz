---
title: Time complexity
description: How the running time of an algorithm grows with input size.
tags:
  - dsa
  - complexity
---

**Time complexity** describes how the running time of an algorithm grows with input size.

```js
for (const item of items) {
  console.log(item)
}
```

This loop is `O(n)` because it does work once for each item. A nested loop over the same input is often `O(n^2)`.

Time complexity is usually expressed with [[big-o-notation|Big O notation]]. It ignores constant factors so you can reason about growth.
