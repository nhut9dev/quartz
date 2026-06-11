---
title: Rendering pipeline
description: The steps a browser uses to turn page data into pixels.
tags:
  - browser
  - performance
---

The **rendering pipeline** is the browser work that turns page state into pixels on screen.

At a high level, the browser parses HTML into the [[../dom/dom-tree|DOM]], parses CSS into style rules, computes layout, paints visual layers, and composites them into the final frame.

Changing geometry usually causes layout. Changing visual properties like color usually causes paint. Changing transform or opacity can often be handled by compositing.

## Why it matters

Rendering work competes with JavaScript and user input on the main thread. If scripts, style calculation, layout, or paint take too long, the page feels delayed even when the network is fast.

Layout is usually the expensive step to avoid accidentally. Reading layout values after writing styles can force synchronous layout, which makes repeated DOM updates much slower.

## Practical guidance

Batch DOM reads and writes, avoid layout thrashing, reserve space for images and embeds, and prefer `transform` or `opacity` for lightweight animations.

When debugging, connect the pipeline to user-facing metrics. Layout instability affects CLS, slow main-thread work can hurt INP, and render-blocking resources can delay LCP.

Understanding the pipeline helps explain [[../frontend-performance/reflow-repaint|reflow and repaint]], [[../css/layout-shift|layout shift]], [[../frontend-performance/critical-rendering-path|critical rendering path]], and [[../web/core-web-vitals|Core Web Vitals]].
