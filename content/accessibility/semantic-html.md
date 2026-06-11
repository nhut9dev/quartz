---
title: Semantic HTML
description: HTML that uses elements according to their meaning, not just their appearance.
tags:
  - accessibility
  - html
---

**Semantic HTML** uses [[html-element|elements]] for their meaning. A button should be a `<button>`, navigation should use `<nav>`, and headings should describe the page structure.

```html
<button type="button">Save</button>
```

Semantic elements give browsers and [[screen-reader|assistive technologies]] built-in information about role, state, keyboard behavior, and structure. This reduces the amount of custom [[aria|ARIA]] needed.

Start with semantic HTML before adding custom JavaScript behavior.
