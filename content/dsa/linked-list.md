---
title: Linked list
description: A sequence of nodes where each node points to the next node.
tags:
  - dsa
  - data-structure
---

A **linked list** stores a sequence as nodes. Each node contains a value and a reference to the next node.

```txt
A -> B -> C -> null
```

Linked lists can insert or remove nodes cheaply when you already have the relevant node reference. Random access is slow because reaching the nth item requires walking from the head.

Arrays are usually simpler and faster in everyday JavaScript, but linked lists are useful for understanding pointers, queues, caches, and low-level data structure tradeoffs.
