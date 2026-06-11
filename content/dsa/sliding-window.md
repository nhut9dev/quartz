---
title: Sliding window
description: Maintaining a moving subrange to solve subarray and substring problems efficiently.
tags:
  - dsa
---

The **sliding window** technique tracks a contiguous range of a sequence and slides its boundaries instead of recomputing each subrange from scratch.

A fixed window keeps a constant size; a dynamic window grows and shrinks to satisfy a condition, updating a running sum or count as elements enter and leave.

Use it for problems like the longest substring without repeats, maximum sum of `k` consecutive items, or smallest range meeting a target.

The tradeoff is that it only applies when subranges are contiguous and the running state updates incrementally.

It builds directly on the [[two-pointer|two-pointer]] idea, turning many O(n²) scans into O(n).
