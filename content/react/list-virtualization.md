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

```jsx
import { useVirtualizer } from "@tanstack/react-virtual"

const rowVirtualizer = useVirtualizer({
  count: rows.length,
  getScrollElement: () => parentRef.current,
  estimateSize: () => 40,
})
```

## How it works

The technique measures the scroll container's size, calculates which item indices currently fall within the visible area (plus a small overscan buffer above and below), and renders only those rows — each absolutely positioned at its computed offset within a full-height spacer element that gives the scrollbar the correct total size. As the user scrolls, the visible index range changes, so different rows mount and unmount; libraries recycle the underlying DOM nodes rather than constantly creating new ones. The spacer element is what makes the scrollbar behave as if all 10,000 rows exist, even though only ~20 are ever in the DOM.

## When to use

Reach for it when a list is genuinely long — hundreds to thousands of rows — and especially when each row is non-trivial (images, multiple interactive elements, complex layout). For a few hundred simple rows, the bookkeeping (measuring, positioning, recycling) costs more in complexity than it saves in render time; plain [[list-rendering|list rendering]] with good [[react-key|keys]] is simpler and fast enough.

## Trade-offs

Virtualization keeps DOM size and reconciliation cost roughly constant regardless of data length, which is the only way to keep a 10k-row list responsive. The cost is architectural: the list no longer behaves like normal DOM. Variable row heights need to be measured or estimated and corrected after the fact (causing layout shift if estimates are wrong), and scroll-position restoration (returning to a list after navigating away) requires explicitly saving and restoring the scroll offset rather than relying on the browser's natural behavior.

## Pitfalls

Browser-native and assistive-technology features that assume the full list is in the DOM break: in-page find (Ctrl+F) can't find text in rows that aren't currently mounted, and screen readers announcing "item 5 of 10000" need explicit `aria-rowcount`/`aria-rowindex` hints since the DOM itself only contains ~20 items at a time. Variable-height content (text that wraps differently, images that load asynchronously) that wasn't accounted for in `estimateSize` causes visible jumps as the virtualizer corrects its offset calculations after the real height is measured.
