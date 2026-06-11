---
title: Divide and conquer
description: Splitting a problem, solving the parts recursively, and combining the results.
tags:
  - dsa
---

**Divide and conquer** breaks a problem into smaller independent subproblems, solves each recursively, and combines their results into the final answer.

The three steps are *divide* the input, *conquer* each part recursively down to a base case, and *combine* the partial solutions.

Use it for [[sorting-algorithm|sorting]] (merge sort, quicksort), [[binary-search|binary search]], and large-number or matrix multiplication.

The tradeoff is recursion overhead and the cost of the combine step, which can dominate if it is expensive.

It differs from [[dynamic-programming|dynamic programming]] because its subproblems do not overlap, so there is nothing to cache.
