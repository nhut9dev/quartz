---
title: Consistent hashing
description: A hashing strategy that reduces key movement when nodes are added or removed.
tags:
  - system-design
  - caching
---

**Consistent hashing** maps keys and nodes onto a hash ring so adding or removing nodes moves only part of the keyspace.

It is useful for distributed caches, sharded stores, and routing keys to workers. Without it, changing the node count can remap most keys and cause a large cache miss or data movement event.

Virtual nodes are often used to smooth uneven distribution across physical nodes.

```js
// walk the sorted ring clockwise to the first node >= hash(key)
function lookup(ring, key) {
  const h = hash(key);
  for (const point of ring) if (point.pos >= h) return point.node;
  return ring[0].node; // wrap around
}
```

Consistent hashing is a building block for [[../caching/redis|Redis]] clusters, distributed caches, and partitioned systems.
