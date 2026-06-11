---
title: picture and srcset
description: HTML image features for responsive and art-directed images.
tags:
  - html
  - performance
---

`srcset` lets the browser choose an image source based on device size or pixel density.

The `picture` element allows art direction, such as using a different crop on small screens.

```html
<picture>
  <source media="(min-width: 800px)" srcset="hero-wide.jpg" />
  <img src="hero.jpg" alt="..." />
</picture>
```

These features improve performance and presentation by avoiding one oversized image for every situation.
