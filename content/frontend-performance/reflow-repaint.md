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
