---
title: Responsive design
description: Designing layouts that adapt to different screen sizes and input conditions.
tags:
  - css
  - web
---

**Responsive design** means building interfaces that adapt to different screen sizes, device capabilities, and input methods.

Responsive CSS usually combines fluid layout, flexible media, sensible constraints, and [[media-query|media queries]].

```css
.cards {
  display: grid;
  grid-template-columns: repeat(auto-fit, minmax(220px, 1fr));
  gap: 16px;
}
```

Good responsive design is not just shrinking a desktop layout. It decides which information should be visible, stacked, hidden, or simplified at each size.
