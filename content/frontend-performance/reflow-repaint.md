---
title: Reflow and repaint
description: Browser rendering work caused by layout and visual changes.
tags:
  - performance
  - css
---

**Reflow** recalculates [[critical-rendering-path|layout]]. **Repaint** redraws visual pixels.

Layout-affecting changes such as width, height, font size, and DOM insertion can trigger reflow.

Paint-affecting changes such as color and shadow may repaint without recalculating layout.

Prefer batching DOM reads and writes. Animate `transform` and `opacity` when possible.

## How it works

The three rendering stages have very different costs. **Layout** recalculates geometry — sometimes for the whole document, sometimes for a subtree — whenever something that affects size or position changes (`width`, `top`, `font-size`, adding/removing DOM nodes). **Paint** redraws pixels for whatever changed visually (`color`, `box-shadow`) without recomputing geometry. **Compositing** assembles already-painted layers on the GPU — and `transform` and `opacity` changes can be handled *purely* by the compositor, skipping layout and paint entirely, if the element is already promoted to its own layer.

## When to use

For anything animated or updated frequently — drag interactions, scroll-linked effects, transitions — prefer properties that only trigger compositing (`transform`, `opacity`) over properties that trigger layout (`width`, `height`, `top`, `left`, `margin`). The visual result can often be identical (`transform: translateX()` vs. animating `left`), but one runs on the compositor at 60fps and the other re-runs layout on every frame.

## Trade-offs

Promoting an element to its own compositor layer (via `will-change` or a `transform`) makes its animations cheap to run, but each promoted layer consumes GPU memory — promoting too many elements ("layer explosion") can itself cause jank or hit memory limits, especially on mobile. `will-change` should be applied to elements that are about to animate, not as a blanket performance hint on everything.

## Pitfalls

**Layout thrashing** (forced synchronous layout) happens when code writes a style and then immediately reads a layout-dependent property — `el.style.width = "100px"; const h = el.offsetHeight` — inside a loop. The read forces the browser to flush all pending style changes and recompute layout *synchronously*, right then, instead of batching it with the next frame; doing this for every element in a loop turns one layout pass into N. The fix is to batch all reads before any writes — read every `offsetHeight` first, then apply all the style changes after.
