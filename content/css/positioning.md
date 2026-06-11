---
title: Positioning
description: CSS rules for controlling where an element appears relative to normal document flow.
tags:
  - css
  - layout
---

**Positioning** controls where an element appears relative to normal document flow, a positioned ancestor, or the viewport. The values are `static` (the default flow), `relative` (stays in flow but accepts offsets), `absolute` (positioned against an ancestor, removed from flow), `fixed` (positioned against the viewport), and `sticky` (relative until a scroll threshold).

```css
.popover {
  position: absolute;
  top: 100%;
  right: 0;
}
```

## The containing block

`absolute` resolves its offsets against the nearest ancestor that is itself positioned (anything but `static`) — and if there is none, it falls back to the viewport. This is the single biggest source of confusion: a `position: absolute` child "jumping" to the page corner means no ancestor was positioned, so add `position: relative` to the intended parent. `fixed` normally uses the viewport, *unless* an ancestor has a `transform`, `filter`, or `will-change`, which makes that ancestor the containing block instead.

## sticky

`sticky` acts like `relative` until the element hits a threshold (`top: 0`), then sticks within its scroll container. It silently fails if no threshold is set, if the parent isn't tall enough to scroll, or if an ancestor has `overflow: hidden`.

## Pitfalls

`z-index` only works on positioned elements and only within their [[stacking-context|stacking context]]. Absolute and fixed elements leave normal flow, so siblings ignore them — they don't reserve space. Most page layout should still start with [[flexbox|Flexbox]] or [[grid|Grid]]; reserve positioning for overlays, badges, and popovers.
