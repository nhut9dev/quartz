---
title: Reduced motion
description: A user preference that asks websites to reduce motion and animation.
tags:
  - accessibility
  - css
---

**Reduced motion** is a user preference exposed through the `prefers-reduced-motion` media feature.

```css
@media (prefers-reduced-motion: reduce) {
  * {
    scroll-behavior: auto;
  }
}
```

Respect it for large movement, parallax, autoplay animation, and transitions that can cause discomfort.

The goal is not removing all feedback. It is reducing motion that is unnecessary or physically disruptive.
