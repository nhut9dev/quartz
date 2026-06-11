---
title: DOM manipulation
description: Creating, inserting, and removing nodes to change the page from JavaScript.
tags:
  - dom
  - structure
---

**DOM manipulation** is how you change the page after it loads: build nodes with `createElement`, put them in the [[dom-tree|DOM tree]] with `append`, and pull them out with `remove`.

```js
const li = document.createElement("li");
li.textContent = "New item";       // safe: treated as plain text
list.append(li);
li.remove();
```

Prefer `textContent` for text. `innerHTML` parses its string as HTML, so injecting untrusted input opens an XSS hole where an attacker's `<script>` or event-handler attribute can run. Use `innerHTML` only with content you control.

Reach for this whenever you render data, add list items, or tear down UI in response to a user action.
