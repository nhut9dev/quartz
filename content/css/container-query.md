---
title: Container query
description: A CSS feature that styles an element based on its container size.
tags:
  - css
---

A **container query** lets a component respond to the size of its parent container, not the whole viewport.

This is useful for reusable components that can appear in a sidebar, grid card, modal, or full-width page section.

```css
.card-list {
  container-type: inline-size;
}

@container (min-width: 480px) {
  .card {
    display: grid;
  }
}
```

Use [[media-query|media queries]] for page-level breakpoints and container queries for component-level layout changes.
