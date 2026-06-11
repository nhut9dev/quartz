---
title: React Testing Library
description: A library for testing React components through user-visible behavior.
tags:
  - react
  - testing
---

**React Testing Library** helps test React components through the behavior users can observe. Tests usually find elements by role, label, text, or placeholder instead of implementation details.

```jsx
expect(screen.getByRole("button", { name: "Save" })).toBeEnabled()
```

This style pairs well with [[../../accessibility/semantic-html|semantic HTML]] because accessible queries match how assistive technologies understand the page.
