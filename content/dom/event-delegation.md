---
title: Event delegation
description: Handling events from many child elements with a single listener on a shared parent.
tags:
  - dom
  - events
---

**Event delegation** puts one listener on a parent element and lets [[event-bubbling|event bubbling]] carry child events up to it, instead of attaching a listener to every child. You inspect `event.target` to learn which child was actually clicked.

```js
list.addEventListener("click", (event) => {
  const item = event.target.closest("li");
  if (item) select(item);
});
```

This stays correct even when items are added or removed later, since the listener lives on the stable parent rather than on the children. It also uses far less memory than one handler per row.

Reach for delegation when you have a long or dynamic list and want a single handler to manage clicks across all of its items.
