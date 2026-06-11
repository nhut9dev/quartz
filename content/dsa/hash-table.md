---
title: Hash table
description: A data structure that maps keys to buckets using a hash function.
tags:
  - dsa
  - data-structure
---

A **hash table** stores key-value data by passing each key through a hash function and using the result to choose where the value belongs.

The goal is fast lookup, insertion, and deletion. In the average case, these operations are `O(1)`. In the worst case, many keys can collide into the same bucket and make operations slower.

Hash tables are the idea behind structures such as [[hashmap|HashMap]], JavaScript [[../javascript/map|Map]], sets, caches, and lookup tables.
