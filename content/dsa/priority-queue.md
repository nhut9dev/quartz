---
title: Priority queue
description: A queue where items are removed by priority instead of insertion order.
tags:
  - dsa
  - data-structure
---

A **priority queue** removes items by priority instead of normal first-in, first-out order.

```txt
enqueue low
enqueue high
dequeue -> high
```

Priority queues are useful for task scheduling, shortest-path algorithms, simulations, and "top k" problems.

They are often implemented with a [[heap|heap]], which makes inserting and removing the highest-priority item efficient.
