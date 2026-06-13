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

## How it works

LCP measures the time until the largest visible element — often a hero image or heading — finishes rendering. CLS sums "layout shift scores" for unexpected movement of visible elements, weighted by how much of the viewport moved and how far it shifted. INP samples the latency of interactions across the page visit and reports a high percentile, capturing the full time from user input to the next paint — including however long the event handler takes to run.

## When to use

Lab tools like Lighthouse run a single synthetic page load on fixed hardware and network conditions — useful for catching regressions in CI, but not representative of real traffic. Field data (from Chrome's User Experience Report or your own real-user monitoring) aggregates actual visitors and is what feeds search ranking; the two can disagree, especially once real devices and networks are slower than the lab's.

## Trade-offs

Optimizing purely for a lab score risks tuning for that test's specific conditions rather than the real distribution of users — field data is noisier and slower to get feedback from, but it's the one that reflects what visitors actually experience and the one ranking is based on.

## Pitfalls

CLS regressions usually come from content that loads after the initial render without reserving space — images missing `width`/`height`, late-loading ads or embeds, or a font swap that changes text metrics, see [[../../frontend-performance/font-loading|font loading]]. LCP can look bad even when your own assets are fast if a third-party script blocks the main content from rendering. INP problems often trace back to one expensive event handler or a large synchronous re-render that blocks the main thread on a click.
