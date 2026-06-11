---
title: List virtualization
description: Rendering only the visible slice of a long list so the DOM stays small.
tags:
  - react
  - performance
  - rendering
---

**List virtualization** (windowing) renders only the rows currently in the viewport plus a small buffer, instead of mounting every item.

A list of 10,000 rows means 10,000 DOM nodes, 10,000 component instances, and a [[reconciliation|reconciliation]] pass over all of them on every [[re-render|re-render]]. The browser also spends layout and paint time on nodes nobody can see. Virtualization keeps the mounted count roughly constant no matter how long the data is.

The technique measures the scroll container, calculates which items fall in view, renders just those — absolutely positioned at the right offset — and recycles nodes as you scroll.

```jsx
import { useVirtualizer } from "@tanstack/react-virtual"

const rowVirtualizer = useVirtualizer({
  count: rows.length,
  getScrollElement: () => parentRef.current,
  estimateSize: () => 40,
})
```

Common libraries are TanStack Virtual, `react-window`, and `react-virtuoso`. The hard parts are variable row heights, scroll restoration, and accessibility — virtualized rows break in-page find and screen-reader counts unless you add hints like `aria-rowcount`.

Reach for it only when a list is genuinely long; for a few hundred simple rows the bookkeeping costs more than it saves.
