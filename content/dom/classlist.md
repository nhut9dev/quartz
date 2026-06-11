---
title: classList
description: Reading and changing an element's classes without overwriting the whole className.
tags:
  - dom
  - styling
---

`classList` is a live token list of an element's CSS classes, with methods to change them one at a time: `add`, `remove`, `toggle`, and `contains`.

```js
panel.classList.add("open");
panel.classList.toggle("dark");          // flip it on or off
if (panel.classList.contains("open")) close(panel);
```

This is safer than assigning to `element.className`, which replaces every class as one string and silently wipes out classes you did not mean to touch. `toggle` even accepts a second boolean argument to force a class on or off based on a condition.

Use `classList` whenever you flip UI state like active, hidden, or selected, rather than rebuilding the full class string by hand.
