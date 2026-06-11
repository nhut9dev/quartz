---
title: Script loading
description: How placement, defer, async, and modules affect script timing.
tags:
  - html
  - performance
---

**Script loading** is about when a `<script>` is fetched and run relative to HTML parsing. A plain script in the middle of the page blocks parsing while it downloads and executes, so placement and loading attributes matter.

```html
<script src="app.js" defer></script>
<script src="analytics.js" async></script>
<script type="module" src="main.js"></script>
```

## defer vs async vs module

All three download in parallel without blocking the parser; they differ in *when they run*. `defer` waits until parsing finishes and runs scripts in document order — right for app code that touches the [[dom-tree|DOM tree]] or depends on other scripts. `async` runs the moment it arrives, in no guaranteed order — right for self-contained scripts like analytics. `type="module"` is deferred by default, has its own scope, and supports `import`/`export`.

## Why a plain script blocks

Without an attribute, the parser stops at the `<script>`, downloads it, executes it, then resumes — because the script might `document.write`. That stall is why the old advice was to put scripts at the end of `<body>`; `defer` achieves the same without the awkward placement.

## Pitfalls

Marking a DOM-dependent or order-dependent script `async` is a race — it may run before the element it needs exists, or before its dependency loads. Inline scripts ignore `defer`/`async` (they have nothing to download), so they still run immediately at their position. And cross-origin `type="module"` needs CORS headers to load.
