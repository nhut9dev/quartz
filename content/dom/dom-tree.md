---
title: DOM tree
description: The HTML document parsed into a tree of nodes that JavaScript can read and update.
tags:
  - dom
  - structure
---

The **DOM tree** is the browser's in-memory model of a page: the HTML is parsed into a tree of nodes, with the `document` object as the root. Most nodes are element nodes (`<div>`, `<p>`), but text between tags becomes text nodes too.

```js
document.body.firstChild;      // first child node
document.querySelector("p").parentNode;   // walk up
```

Every node knows its neighbors through relationships like `parentNode`, `childNodes`, `nextSibling`, and `previousSibling`. Because the tree is live, changing a node updates what the user sees.

Reach for this mental model whenever you select elements with [[query-selector|querySelector]] or move them around with [[dom-manipulation|DOM manipulation]].
