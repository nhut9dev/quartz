---
title: Array
description: A contiguous, ordered collection accessed by numeric index.
tags:
  - dsa
  - data-structure
---

An **array** is an ordered collection where items are accessed by numeric index.

```js
const names = ["Ada", "Grace", "Linus"]
names[0] // "Ada"
```

Index lookup is usually `O(1)`. Searching an unsorted array is `O(n)` because you may need to inspect every item.

Arrays are good for ordered data, iteration, random access, and compact storage. Insertions and deletions near the front can be expensive because later items may need to shift.
