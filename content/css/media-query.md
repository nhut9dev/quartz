---
title: Media query
description: A CSS rule that applies styles only when device or viewport conditions match.
tags:
  - css
  - responsive
---

A **media query** applies CSS only when certain conditions match, such as viewport width, color scheme, reduced motion preference, or pointer type.

```css
@media (max-width: 640px) {
  .sidebar {
    display: none;
  }
}
```

Media queries are a core tool for [[responsive-design|responsive design]]. They should adjust layout and interaction details, not carry completely unrelated design systems for each screen size.
