---
title: IntersectionObserver
description: Watching when an element enters or leaves the viewport without scroll-event spam.
tags:
  - dom
  - observers
---

`IntersectionObserver` runs a callback whenever a watched element crosses into or out of the viewport (or another root). You create one observer and tell it which elements to watch.

```js
const observer = new IntersectionObserver((entries) => {
  for (const entry of entries) {
    if (entry.isIntersecting) loadImage(entry.target);
  }
});
observer.observe(document.querySelector("img.lazy"));
```

Each `entry` reports whether its target is visible via `isIntersecting`. The browser batches and schedules these checks itself, so you avoid wiring a noisy `scroll` listener that fires on every pixel and forces layout reads.

Reach for it for lazy-loading images, triggering animations on reveal, or building infinite scroll.
