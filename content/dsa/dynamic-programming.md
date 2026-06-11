---
title: Dynamic programming
description: Solving overlapping subproblems once and reusing results via memoization or tabulation.
tags:
  - dsa
---

**Dynamic programming** solves a problem by breaking it into overlapping subproblems, computing each one only once, and reusing the stored answer.

*Memoization* (top-down) caches results of recursive calls, while *tabulation* (bottom-up) fills a table iteratively from base cases.

Use it when a problem has optimal substructure and overlapping subproblems, such as Fibonacci, knapsack, longest common subsequence, or shortest paths.

The tradeoff is extra memory for the cache or table, and the effort of defining the right state and transition.

It often turns the exponential cost of naive [[recursion-algorithm|recursion]] into polynomial time, where plain [[backtracking|backtracking]] would recompute the same work.
