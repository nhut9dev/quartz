---
title: GSAP
description: A JS animation library for timelines, sequencing, and easing beyond CSS.
tags:
  - animation
  - frontend
---

**GSAP** (GreenSock Animation Platform) is a JavaScript animation library for sequencing, timelines, and easing beyond what CSS or the [[web-animations-api|Web Animations API]] expresses directly.

```js
gsap.timeline()
  .to(".box", { x: 100, duration: 0.3 })
  .to(".label", { opacity: 1, duration: 0.2 }, "-=0.1")
```

## How it works

GSAP's core primitive is the tween — animate a property from A to B over time with an easing curve — and its timeline groups tweens with explicit ordering, overlap, and stagger. `"-=0.1"` above starts the second tween 0.1s before the first finishes. Under the hood GSAP still animates DOM/CSS properties (or canvas/WebGL values via plugins), but manages timing and sequencing itself rather than relying on the browser's animation engines.

## When to use

Reach for GSAP when an animation needs orchestration that's awkward in CSS or WAAPI: staggered entrance animations across a list, scroll-triggered sequences (via the ScrollTrigger plugin), or timelines where multiple elements' animations must be coordinated and replayed or reversed as a unit. For a single hover or focus transition, plain [[../css/css-animation|CSS]] is simpler and needs no library.

## Trade-offs

GSAP's timeline API makes complex sequencing far more manageable than hand-coordinating multiple CSS animations or [[web-animations-api|WAAPI]] calls with `setTimeout` — at the cost of an added dependency, and animations defined in JS rather than CSS, which can make them harder to discover and tune without running the app.

## Pitfalls

GSAP can animate any numeric property, including layout-affecting ones like `width` or `top` — doing so on the main thread causes the same jank as animating those properties via CSS, since GSAP doesn't get compositor-only execution for properties the browser can't run off-thread either. Timelines created inside a component but never killed on cleanup (`tl.kill()`) keep running against unmounted DOM, the animation equivalent of a [[../react/effect-cleanup|missing effect cleanup]].
