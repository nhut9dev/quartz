---
title: "@apply directive"
description: Inlining Tailwind utilities into a custom CSS rule, and why to use it sparingly.
tags:
  - tailwind
  - css
---

`@apply` inlines existing Tailwind utilities into a custom CSS rule, so you can reuse a set of utilities where you can't put classes in markup.

```css
.prose a {
  @apply text-brand underline underline-offset-2;
}
```

Its legitimate uses are narrow: styling third-party markup you don't control, hitting complex selectors or pseudo-elements, or setting base styles. `@layer` is the related tool for slotting custom CSS into Tailwind's [[../css/cascade-layer|cascade layers]] so it sorts correctly against utilities.

The important caution: `@apply` is heavily overused. Rebuilding component classes like `.btn { @apply ... }` throws away Tailwind's main benefits — colocation and no naming — and quietly reintroduces the very CSS file Tailwind was meant to remove. When you want reuse, extract a [[../react/react-component|component]] or loop in the template instead. Treat `@apply` as a rare exception, not a styling pattern.
