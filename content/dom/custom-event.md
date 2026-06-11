---
title: CustomEvent
description: A DOM event created by application code with optional custom detail data.
tags:
  - dom
---

**CustomEvent** creates an event with application-specific meaning.

```js
element.dispatchEvent(
  new CustomEvent("cart:add", { detail: { productId: "p1" } }),
)
```

It is useful for web components, isolated widgets, and integration boundaries.

Keep custom event names clear and documented. Hidden event contracts can become hard to maintain.
