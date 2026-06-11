---
title: Cascade layer
description: A CSS feature that controls cascade order by named layers.
tags:
  - css
---

**Cascade layers** let CSS authors define high-level priority groups.

```css
@layer reset, base, components, utilities;
```

Layers help manage resets, design system styles, component styles, and utility classes without relying only on selector specificity.
