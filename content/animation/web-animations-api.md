---
title: Web Animations API
description: A JS API for creating compositor-driven animations with playback control.
tags:
  - animation
  - browser
---

The **Web Animations API** (WAAPI) lets JavaScript create and control animations — keyframes and timing — that run on the browser's compositor, with the same performance profile as CSS animations but with playback control (play, pause, reverse, seek) from JS.

```js
element.animate(
  [{ transform: "translateY(0)" }, { transform: "translateY(-8px)" }],
  { duration: 200, easing: "ease-out", fill: "forwards" }
)
```

## How it works

`element.animate(keyframes, options)` returns an `Animation` object backed by the same compositor thread that runs CSS transitions and keyframe animations — properties like `transform`, `opacity`, and `filter` animate off the main thread, so they keep running smoothly even if JS is busy. The `Animation` object exposes playback controls (`play`, `pause`, `reverse`, `currentTime`, `playbackRate`) and a `finished` promise.

## When to use

Use WAAPI when an animation needs to be defined or controlled dynamically from JS — sequencing, runtime-computed keyframes, pausing or resuming based on user interaction — without pulling in a full animation library. For purely declarative state-based animations (hover, focus, simple transitions), [[../css/css-animation|CSS transitions or keyframes]] are simpler. For heavy orchestration (staggered lists, chained timelines), [[gsap|GSAP]] gives a higher-level API.

## Trade-offs

WAAPI gets the same off-main-thread compositor performance as CSS for `transform`/`opacity`/`filter`, plus JS-level control CSS doesn't offer — but its API is lower-level than a library like GSAP, so complex sequencing requires more manual bookkeeping.

## Pitfalls

Only a subset of properties — `transform`, `opacity`, `filter`, and a few others — can animate on the compositor without triggering layout or paint. Animating `width`, `top`, or `box-shadow` falls back to main-thread work and can jank under load, the same as animating those properties via CSS. `element.animate()` returns immediately and doesn't await anything — forgetting to handle the `finished` promise, or to call `.cancel()` on cleanup, can leave animations running against elements that have already been removed.
