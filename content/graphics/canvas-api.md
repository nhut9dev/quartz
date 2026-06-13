---
title: Canvas API
description: An imperative, pixel-based 2D drawing API for the <canvas> element.
tags:
  - graphics
  - browser
---

The **Canvas API** draws 2D graphics onto a `<canvas>` element using an imperative, immediate-mode API — drawing commands paint pixels directly onto a bitmap, and the browser keeps no memory of what was drawn.

```js
const ctx = canvas.getContext("2d")
ctx.fillStyle = "tomato"
ctx.fillRect(10, 10, 100, 50)
```

## How it works

Each draw call paints pixels directly onto the canvas's bitmap. There's no DOM node per shape and no scene graph — the canvas doesn't track what's "on" it. To change anything, the app clears (or paints over) the affected area and redraws, usually inside a [[../animation/request-animation-frame|requestAnimationFrame]] loop for anything that moves.

## When to use

Reach for canvas for pixel-heavy or high-frequency-redraw content: games, drawing/annotation tools, image manipulation, particle effects, or charts with thousands of points where per-element DOM nodes would be too slow. Avoid it when individual shapes need to be accessible to screen readers, styled with CSS, or individually clickable without manual hit-testing — [[svg|SVG]] gives all of that for free because each shape is a DOM node.

## Trade-offs

Canvas scales to huge numbers of drawn elements because cost is proportional to pixels painted, not shape count — but everything on it is just pixels. There's no built-in accessibility tree, no CSS styling of individual shapes, and figuring out what the user clicked is hand-rolled math against shape coordinates.

## Pitfalls

Canvas content is invisible to screen readers and not selectable or searchable by default — accessible canvas apps need a parallel DOM description or rely on the element's fallback content. On high-DPI screens, the canvas's backing store must be scaled manually (`canvas.width = cssWidth * devicePixelRatio`) or drawings render blurry. And because canvas is immediate-mode, resizing the element clears its contents — the app must keep its own data model and redraw from scratch rather than relying on the canvas to "remember" anything.
