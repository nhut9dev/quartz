---
title: Backtracking
description: Building candidates incrementally and abandoning a path as soon as it cannot succeed.
tags:
  - dsa
---

**Backtracking** builds a solution one choice at a time and abandons a partial path the moment it can no longer lead to a valid result, then undoes the last choice and tries another.

It explores a decision tree depth-first, pruning branches that violate constraints early to avoid wasted work.

Use it for combinatorial problems like permutations, subsets, the N-queens puzzle, Sudoku, and maze solving.

The tradeoff is exponential worst-case time; pruning helps but does not guarantee efficiency.

It is built on [[recursion-algorithm|recursion]] and [[depth-first-search|depth-first search]], and when subproblems repeat, [[dynamic-programming|dynamic programming]] may be a better fit.
