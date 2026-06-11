---
title: CSS transition
description: A CSS feature for animating a property between two states.
tags:
  - css
---

A **CSS transition** animates a property when its value changes.

```css
.button {
  transition: background-color 160ms ease, transform 160ms ease;
}

.button:hover {
  transform: translateY(-1px);
}
```

Transitions are best for small state changes like hover, focus, opening, closing, and selection.

Prefer animating `opacity` and `transform` when possible because they are usually cheaper for the browser than layout-affecting properties.
