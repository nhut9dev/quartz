---
title: Event object
description: The object passed to every event handler describing what happened and where.
tags:
  - dom
  - events
---

The **Event object** is the single argument the browser passes to a handler registered with [[add-event-listener|addEventListener]]. It carries details about the event and methods to control it.

```js
form.addEventListener("submit", (event) => {
  event.preventDefault();        // stop the default page reload
  console.log(event.target);     // element that fired the event
});
```

`event.target` is the element where the event originated, while `event.currentTarget` is the element the handler is attached to; they differ once events travel between elements. `preventDefault()` cancels the browser's default action, and `stopPropagation()` halts the event's journey through the [[dom-tree|DOM tree]].

Read `event.target` whenever one handler covers many possible sources, as with [[event-delegation|event delegation]].
