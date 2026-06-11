---
title: addEventListener
description: Attaching functions that run when an element fires a given event.
tags:
  - dom
  - events
---

`addEventListener` registers a handler that runs when an element emits an event like `"click"` or `"input"`. The handler receives one argument, the [[event-object|Event object]], describing what happened.

```js
function onClick(event) {
  console.log(event.target);
}
button.addEventListener("click", onClick, { once: true });
button.removeEventListener("click", onClick);   // needs the same reference
```

The third argument is an options object: `{ once: true }` removes the handler after it runs, and `{ capture: true }` fires during the capture phase. To detach later with `removeEventListener`, pass the exact same function reference, so avoid inline arrow functions when you need to remove a handler.

In React you usually pass a [[react-event-handler|React event handler]] as a prop instead of calling this directly.
