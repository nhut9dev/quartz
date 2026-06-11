---
title: Binary search tree
description: A binary tree where left values are smaller and right values are larger.
tags:
  - dsa
  - data-structure
---

A **binary search tree** is a tree where each node has at most two children. Values smaller than the node go to the left; values larger go to the right.

This ordering makes search, insert, and delete efficient when the tree stays balanced. A balanced binary search tree can search in `O(log n)` time.

If values are inserted in sorted order and the tree is not rebalanced, it can degrade into a linked-list shape with `O(n)` search.
