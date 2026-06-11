---
title: Responsive variants
description: Applying Tailwind utilities at specific breakpoints, mobile-first.
tags:
  - tailwind
  - css
---

**Responsive variants** apply a utility only from a given screen width up, using a breakpoint prefix. Tailwind is **mobile-first**: an unprefixed utility applies at every size, and a prefix like `md:` layers on from that breakpoint upward.

```html
<div class="block md:flex">...</div>
<!-- stacked on small screens, flex row from md (768px) up -->
```

The default breakpoints `sm` `md` `lg` `xl` `2xl` compile to `min-width` [[../css/media-query|media queries]], so you build the small-screen layout as the base and add overrides for larger screens, not the reverse.

The key gotcha: `md:` means "md **and up**", not "only on md". To target a single range or cap an effect, use the `max-*` variants (`max-md:hidden`). For styling based on a parent's size rather than the viewport, Tailwind also supports [[../css/container-query|container queries]] via a `@container` context and `@md:`-style prefixes. This is Tailwind's expression of [[../css/responsive-design|responsive design]].
