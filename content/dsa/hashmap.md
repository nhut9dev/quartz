---
title: HashMap
description: A key-value data structure optimized for fast lookup by key.
tags:
  - dsa
  - data-structure
---

A **HashMap** is a key-value data structure optimized for fast lookup by key. It is usually implemented with a [[hash-table|hash table]].

```js
const counts = new Map()

for (const word of words) {
  counts.set(word, (counts.get(word) ?? 0) + 1)
}
```

HashMaps are useful when you need to count things, group records, check whether a key exists, or avoid repeatedly scanning an array.

Average lookup, insert, and delete are `O(1)`. The tradeoff is extra [[space-complexity|space]] and dependence on good hashing and collision handling.
