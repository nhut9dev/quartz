---
title: CSS variable
description: A reusable custom property value in CSS.
tags:
  - css
---

A **CSS variable** is a custom property that stores a reusable value. Custom properties start with `--` and are read with `var()`.

```css
:root {
  --color-brand: #2563eb;
  --space-4: 16px;
}

.button {
  background: var(--color-brand);
  padding: var(--space-4);
}
```

CSS variables are useful for design tokens, themes, spacing scales, and component-level configuration. Unlike preprocessor variables, they exist at runtime and can change based on selectors, media queries, or inline styles.
