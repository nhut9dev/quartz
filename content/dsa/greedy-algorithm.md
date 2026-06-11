---
title: Greedy algorithm
description: Making the locally optimal choice at each step, when that yields a global optimum.
tags:
  - dsa
---

A **greedy algorithm** builds a solution by always taking the choice that looks best right now, never reconsidering past decisions.

It works only when local optimal choices provably lead to a global optimum, a property called the greedy-choice property combined with optimal substructure.

Use it for problems like coin change with canonical denominations, interval scheduling, Huffman coding, and minimum spanning trees.

The tradeoff is that greed can fail silently: for many problems the locally best step leads to a worse overall answer.

When greed does not hold, [[dynamic-programming|dynamic programming]] explores choices exhaustively and is the safer alternative.
