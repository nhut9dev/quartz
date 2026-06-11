---
title: Binary search
description: An algorithm for finding a value in sorted data by repeatedly halving the search range.
tags:
  - dsa
  - algorithm
---

**Binary search** finds a value in sorted data by repeatedly cutting the search range in half.

```js
function binarySearch(nums, target) {
  let left = 0
  let right = nums.length - 1

  while (left <= right) {
    const mid = Math.floor((left + right) / 2)

    if (nums[mid] === target) return mid
    if (nums[mid] < target) left = mid + 1
    else right = mid - 1
  }

  return -1
}
```

Binary search is `O(log n)`, but it only works when the search space is sorted or otherwise monotonic.
