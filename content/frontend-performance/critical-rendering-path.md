---
title: Critical rendering path
description: The browser work needed to turn HTML, CSS, and JavaScript into pixels.
tags:
  - performance
  - web
---

The **critical rendering path** is the sequence of work a browser performs to render a page.

It includes parsing HTML, building the DOM, loading CSS, building the CSSOM, running blocking JavaScript, creating layout, painting, and compositing.

Performance improves when critical resources are smaller, fewer, [[caching|cached]], and loaded in the right order.

## How it works

The steps form a dependency chain, not independent tasks. The browser can't build the render tree until both the DOM (from HTML) and the CSSOM (from CSS) exist — and CSS is render-blocking by default, so a `<link rel="stylesheet">` in `<head>` delays the render tree (and therefore first paint) until it's downloaded and parsed, even if the DOM is ready earlier. A synchronous `<script>` (no `defer`/`async`) blocks HTML parsing entirely at the point it appears, because the script might use `document.write` and the browser can't safely continue parsing past it without running it first. Layout then computes geometry from the render tree, paint fills in pixels, and compositing assembles layers on the GPU.

## When to use

Use this model to diagnose *where* time to first paint is actually going: is it network (large HTML/CSS download), parse-blocking JavaScript in `<head>`, a render-blocking stylesheet that's mostly unused on this page, or an expensive initial layout (a huge DOM)? The fix differs entirely depending on which step is the bottleneck — optimizing images doesn't help if a synchronous third-party script is blocking parsing.

## Trade-offs

Shrinking the critical path — inlining critical above-the-fold CSS, deferring non-critical CSS/JS, splitting bundles — directly speeds up first paint, but adds build complexity: critical CSS extraction needs tooling and gets out of sync with design changes, and deferred resources need careful ordering so they don't compete with what's actually needed first.

## Pitfalls

Shipping one large framework-wide stylesheet in `<head>` makes *every* page render-blocked on CSS that's mostly irrelevant to that page's first paint — the browser must download and parse all of it before showing anything, even the 5% of rules that apply above the fold. Similarly, third-party scripts (analytics, chat widgets) injected synchronously in `<head>` block HTML parsing for as long as their request takes — a slow third-party endpoint becomes your page's bottleneck, even though your own code and assets loaded instantly.
