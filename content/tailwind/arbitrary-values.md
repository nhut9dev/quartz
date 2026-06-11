---
title: Arbitrary values
description: Tailwind's escape hatch for one-off values the design scale doesn't cover.
tags:
  - tailwind
  - css
---

**Arbitrary values** let you supply a one-off value to a utility with square brackets, for the cases the design scale doesn't include.

```html
<div class="top-[117px] bg-[#1da1f2] grid-cols-[1fr_2fr]">...</div>
```

The same bracket syntax also handles arbitrary *properties* Tailwind has no utility for, like `[mask-type:luminance]`, and arbitrary variants like `[&:nth-child(3)]:underline`.

This is an escape hatch, not a default. Reaching for arbitrary values constantly is a sign the value should live in your [[tailwind-config|config]] as a named token instead — that's what keeps the whole UI on one consistent scale. Like every Tailwind class, an arbitrary value must be a **complete static string** in the source; one built by concatenation won't be detected by the engine and the style will be missing at runtime.
