---
title: Touch events
description: DOM events reporting multi-touch contact points on touchscreens.
tags:
  - dom
  - mobile
---

**Touch events** — `touchstart`, `touchmove`, `touchend`, `touchcancel` — report multi-touch contact points on touchscreens. Each event carries `touches` (all current contacts), `targetTouches` (contacts that started on this element), and `changedTouches` (contacts that changed in this event), each a `Touch` object with its own `identifier` and `clientX`/`clientY`.

```js
el.addEventListener("touchstart", e => {
  const touch = e.touches[0]
})
```

For most interactions, [[pointer-events|Pointer Events]] provide a unified API across touch, mouse, and pen and are generally preferred. Touch events remain relevant when an interaction needs to track multiple simultaneous contact points as a group — pinch-to-zoom, multi-finger gestures — since each `Touch` object's `identifier` lets you follow a specific finger across `touchmove` events.

A `touchstart`/`touchmove` handler that calls `preventDefault()` blocks the browser's native scrolling or zooming for that gesture — necessary for custom gesture handling, but it must be done only when the gesture is actually being handled, or it breaks normal scrolling.
