---
title: Tailwind config
description: Customizing Tailwind's design system — colors, spacing, fonts, and breakpoints.
tags:
  - tailwind
  - css
---

**Tailwind configuration** is how you adapt the framework's design system to a project: defining brand colors, spacing, fonts, and breakpoints that become utility classes.

In Tailwind v4 configuration is **CSS-first**. You import Tailwind and declare tokens in a `@theme` block; each token automatically generates matching utilities.

```css
@import "tailwindcss";

@theme {
  --color-brand: #4f46e5;   /* enables bg-brand, text-brand, ... */
  --font-display: "Satoshi", sans-serif;
}
```

These theme variables are real [[../css/css-variable|CSS variables]], so they're also readable at runtime. In v3 the same thing lived in `tailwind.config.js` under `theme.extend`, which still works but is now the legacy path.

The distinction between **extending** and **overriding** matters: adding to the default scale keeps Tailwind's built-in values, while replacing a key (say, all of `colors`) removes them. Treat the theme as your single source of [[../css/design-token|design tokens]] so the whole UI stays on one scale instead of drifting into one-off values.
