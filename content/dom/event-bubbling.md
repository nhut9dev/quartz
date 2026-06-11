---
title: Event bubbling
description: How an event travels from its target element up through its ancestors.
tags:
  - dom
  - events
---

**Event bubbling** is the default way events propagate: after firing on the target, the event rises through each ancestor toward `document`, so a click on a button also reaches its parent and grandparent.

```js
container.addEventListener("click", (event) => {
  console.log("bubbled from", event.target);
});
```

Propagation actually has two phases. First the capture phase travels top-down from the root to the target; then the bubble phase travels bottom-up back out. Handlers run in the bubble phase unless you pass `{ capture: true }`. Call `stopPropagation()` on the [[event-object|Event object]] to end the trip early.

Bubbling is what makes [[event-delegation|event delegation]] possible: one ancestor can hear events from all of its descendants.
