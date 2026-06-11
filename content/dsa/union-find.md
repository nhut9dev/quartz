---
title: Union-find
description: A disjoint-set structure with near-constant union and find via path compression.
tags:
  - dsa
---

**Union-find** (disjoint-set) tracks a collection of non-overlapping sets and answers whether two elements belong to the same set.

It supports two operations: `find` returns a set's representative, and `union` merges two sets. With *path compression* and *union by rank*, both run in near-constant amortized time.

Use it for detecting cycles in a [[graph|graph]], building minimum spanning trees (Kruskal's algorithm), and grouping connected components.

The tradeoff is that it only models connectivity; it cannot efficiently split sets back apart.

It is a compact, array-backed structure that is far faster than repeatedly searching a graph for connectivity.
