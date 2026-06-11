---
title: Image
description: Embedding pictures with alt text, responsive sources, and lazy loading.
tags:
  - html
  - content
---

An **image** is embedded with `<img>`, a void [[html-element|element]] that points at a file via `src`. Its `alt` attribute gives a text alternative, which becomes the image's [[accessible-name|accessible name]] for screen readers and shows when the image fails to load.

```html
<img
  src="photo-800.jpg"
  srcset="photo-400.jpg 400w, photo-800.jpg 800w"
  sizes="(max-width: 600px) 400px, 800px"
  alt="A red bicycle leaning on a wall"
  width="800"
  height="600"
  loading="lazy"
/>
```

`srcset` and `sizes` let the browser pick a source that fits the screen, saving bandwidth on small devices. `loading="lazy"` defers off-screen images until they are needed. Always set `width` and `height` so the browser reserves space and avoids layout shift as the image loads. Use a decorative empty `alt=""` only when the image adds no information.
