---
title: tailwind-merge
description: Resolving conflicting Tailwind classes so the last one reliably wins.
tags:
  - tailwind
  - css
---

**tailwind-merge** (`twMerge`) is a utility that resolves conflicting Tailwind classes by keeping the last one and dropping the rest.

The problem appears when you compose classes — a component's base styles plus overrides passed in by a caller. You can end up with `px-2 px-4` in the same string, and which one applies comes down to the order they sit in the generated stylesheet, not the order in the attribute. That makes overrides unreliable.

```js
import { twMerge } from "tailwind-merge"
twMerge("px-2 py-1 px-4") // "py-1 px-4" — px-4 wins, px-2 removed
```

`twMerge` understands which utilities conflict (it knows `px-4` supersedes `px-2`) and resolves them deterministically. It's almost always combined with `clsx` for conditional classes in the small `cn()` helper most codebases define, and it's the mechanism behind override-friendly component APIs like [[../react/ui-libraries/shadcn-ui|shadcn/ui]]. Without it, a `className` prop meant to override a component's defaults silently does nothing when the base class happens to win on source order.
