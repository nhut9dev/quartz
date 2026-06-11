---
title: Flexbox
description: A one-dimensional CSS layout system for arranging items in a row or column.
tags:
  - css
  - layout
---

**Flexbox** is a CSS layout system for arranging items along one main axis: either a row or a column. It is useful for nav bars, toolbars, centered content, equal-height rows, and simple responsive layouts.

```css
.toolbar {
  display: flex;
  align-items: center;
  justify-content: space-between;
  gap: 12px;
}
```

`justify-content` controls distribution along the main axis. `align-items` controls alignment across the cross axis. `gap` adds space between flex items without adding margins to each child.

Use [[grid|Grid]] when the layout needs rows and columns at the same time.
