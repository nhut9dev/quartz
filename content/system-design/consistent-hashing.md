---
title: Consistent hashing
description: A hashing strategy that reduces key movement when nodes are added or removed.
tags:
  - system-design
  - caching
---

**Consistent hashing** maps both keys and nodes onto the same hash ring, so adding or removing a node moves only a small slice of keys rather than remapping nearly all of them.

## The problem it solves

The naive way to distribute keys across N nodes is `node = hash(key) % N`. It's balanced, but `N` is baked into every assignment: change the node count and the modulus changes, so *almost every* key now maps to a different node. For a distributed cache that means a near-total miss storm (every key suddenly looks up the wrong node); for a sharded store it means a massive data-movement event. Scaling the cluster — the thing you do precisely when under load — triggers the worst-case reshuffle at the worst possible moment.

## How the ring works

Hash the node identifiers onto a circular keyspace (say 0 to 2³²−1), and hash keys onto the same circle. A key is owned by the first node found walking clockwise from the key's position. Now adding a node only steals the keys between it and its predecessor on the ring; removing a node hands its keys to the next node clockwise. Either way, only `K/N` keys move, not all of them.

```js
// walk the sorted ring clockwise to the first node >= hash(key)
function lookup(ring, key) {
  const h = hash(key);
  for (const point of ring) if (point.pos >= h) return point.node;
  return ring[0].node; // wrap around
}
```

## Virtual nodes

With few physical nodes, random placement on the ring leaves uneven gaps, so some nodes own far more of the keyspace than others. The fix is **virtual nodes**: each physical node is hashed onto the ring at many points (e.g. 100–200), averaging out the gaps so load is even. A bonus is that when a node leaves, its load is redistributed across *many* successors instead of dumped entirely on one neighbor.

## Pitfalls

Consistent hashing balances the *keyspace*, not *traffic* — one genuinely [[../caching/hot-key|hot key]] still hammers a single node no matter how evenly the ring is split. Too few virtual nodes brings back the imbalance it was meant to cure; too many cost memory and lookup time. It's a foundational building block for [[../caching/redis|Redis]] clusters, distributed caches, and partitioned data stores.
