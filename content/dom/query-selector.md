---
title: querySelector
description: Selecting elements from the DOM tree using familiar CSS selector syntax.
tags:
  - dom
  - selection
---

`querySelector` finds the first element in the [[dom-tree|DOM tree]] that matches a CSS selector, returning the element or `null`. Its sibling `querySelectorAll` returns a static `NodeList` of every match.

```js
const first = document.querySelector(".card");      // one element or null
const all = document.querySelectorAll(".card");      // NodeList, iterate it
all.forEach((card) => card.classList.add("ready"));
```

When you select by id, `getElementById("main")` is slightly faster and reads cleanly, but `querySelector("#main")` does the same job with consistent syntax. You can also scope a query to a subtree by calling it on an element instead of `document`.

Use `querySelectorAll` when you need every match; reach for `querySelector` when one element is enough.
