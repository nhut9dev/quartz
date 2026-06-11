---
title: Two pointer
description: Using two indices moving over an array or string to solve in one pass.
tags:
  - dsa
---

The **two-pointer** technique uses two indices that scan a sequence together, often replacing a nested loop with a single linear pass.

The pointers may start at both ends and move inward (as in checking a palindrome or pair-sum on a sorted array) or move in the same direction at different speeds.

Use it on sorted [[array-data-structure|arrays]] or strings for problems like removing duplicates, reversing in place, or finding pairs that meet a condition.

The tradeoff is that it usually requires sorted or otherwise ordered input to be correct.

It often turns an O(n²) brute force into O(n), and underlies the related [[sliding-window|sliding window]] technique.
