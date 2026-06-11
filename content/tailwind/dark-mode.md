---
title: Dark mode
description: Styling for dark color schemes with Tailwind's dark variant.
tags:
  - tailwind
  - css
---

**Dark mode** in Tailwind is expressed with the `dark:` variant — a utility prefixed with `dark:` applies only when dark mode is active.

```html
<div class="bg-white text-black dark:bg-gray-900 dark:text-white">...</div>
```

There are two strategies. The **media** strategy follows the OS via `prefers-color-scheme`, so it's automatic but not user-overridable. The **class** (selector) strategy activates `dark:` when a `dark` class is present on a high-level element like `<html>`, which lets you build a manual toggle. You choose the strategy in configuration.

The class strategy needs JavaScript to set the class and persist the user's choice (usually in `localStorage`). Pairing dark mode with [[../css/css-variable|CSS variables]] for your theme tokens keeps the markup simple — flip the variables once on `<html>` instead of writing `dark:` on every element. The classic pitfall is a flash of the wrong theme on load: read the saved preference and set the class in a small inline script **before first paint**, otherwise an [[../web/hydration|SSR]] page renders light, then jumps to dark.
