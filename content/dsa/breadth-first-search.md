---
title: Breadth-first search
description: A traversal algorithm that explores neighbors level by level.
tags:
  - dsa
  - algorithm
---

**Breadth-first search** (BFS) explores a [[graph|graph]] or [[tree|tree]] level by level. It visits all nearby nodes before moving farther away.

BFS usually uses a [[queue|queue]].

```txt
visit root
enqueue children
dequeue next node
repeat
```

BFS is useful for shortest path in an unweighted graph, level-order tree traversal, and finding the closest matching node.
