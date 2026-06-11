---
title: Segment tree
description: A tree for efficient range queries and updates over an array.
tags:
  - dsa
---

A **segment tree** stores aggregate information over ranges of an array so that both range queries and point updates run in logarithmic time.

Each node covers a segment of the array and holds a summary (sum, minimum, maximum, or GCD), with children splitting the range in half.

Use it when an array changes frequently and you repeatedly ask for range sums, minimums, or similar aggregates, where recomputing from scratch would be too slow.

The tradeoff is extra memory and implementation complexity compared with a simple prefix-sum array, which cannot handle updates.

It is a balanced [[tree|tree]] built on the [[divide-and-conquer|divide-and-conquer]] idea of splitting ranges in half.
