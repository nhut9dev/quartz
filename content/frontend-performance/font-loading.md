---
title: Font loading
description: How web fonts affect rendering, layout, and perceived performance.
tags:
  - performance
  - css
---

**Font loading** controls how custom fonts are fetched and displayed.

Large fonts can delay text rendering or cause [[layout-shift|layout shift]] when swapped in.

Use fewer font families and weights, subset fonts when possible, and choose an appropriate `font-display` strategy.

System fonts are often the fastest option for dense application UIs.
