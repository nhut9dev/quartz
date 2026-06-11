---
title: Core Web Vitals
description: Google's user-experience metrics that also influence search ranking.
tags:
  - web
  - performance
  - seo
---

**Core Web Vitals** are Google's user-experience metrics that also feed into search ranking. There are three: LCP (Largest Contentful Paint) measures loading by timing when the main content appears, CLS (Cumulative Layout Shift) measures visual stability by tracking how much the layout jumps, and INP (Interaction to Next Paint) measures responsiveness to user input and replaced the older FID.

Because these scores affect ranking, they tie performance work directly to [[seo]]. Two common improvements help across the board: [[lazy-loading|lazy loading]] offscreen images and components keeps the initial load light, which helps LCP, while [[caching]] serves assets and responses faster on repeat visits.

Treat the vitals as a budget, not a one-time fix. They are measured on real user visits, so regressions creep in as a site grows and need ongoing attention.
