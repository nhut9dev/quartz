---
title: Grid
description: A two-dimensional CSS layout system for rows and columns.
tags:
  - css
  - layout
---

**Grid** is a CSS layout system for arranging content across rows and columns. It is useful for page layouts, dashboards, galleries, and any layout where both dimensions matter.

```css
.layout {
  display: grid;
  grid-template-columns: 240px 1fr;
  gap: 24px;
}
```

Grid defines tracks with `grid-template-columns` and `grid-template-rows`. Children are placed into the grid automatically or explicitly with grid line and area properties.

Use [[flexbox|Flexbox]] for simpler one-dimensional alignment.
