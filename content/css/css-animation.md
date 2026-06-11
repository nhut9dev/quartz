---
title: CSS animation
description: CSS transitions and keyframes for animating visual changes.
tags:
  - css
  - animation
---

**CSS animation** changes visual properties over time. Simple state changes often use transitions; repeated or multi-step motion uses keyframes.

```css
.button {
  transition: background-color 160ms ease, transform 160ms ease;
}

.button:hover {
  transform: translateY(-1px);
}
```

Animations should support the interface instead of distracting from it. For users who prefer reduced motion, use `prefers-reduced-motion` to remove or simplify movement.
