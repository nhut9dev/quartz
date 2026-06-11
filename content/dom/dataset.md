---
title: dataset
description: Reading and writing custom data-* attributes through element.dataset.
tags:
  - dom
  - attributes
---

`dataset` exposes an element's `data-*` attributes as a plain object, letting you stash small bits of custom data on markup and read them back from JavaScript.

```html
<button data-user-id="42" data-role="admin">Edit</button>
```

```js
button.dataset.userId;        // "42"  (data-user-id, camelCased)
button.dataset.role = "guest"; // writes data-role="guest"
```

Attribute names map to camelCase keys, so `data-user-id` becomes `dataset.userId`. Values are always strings, so convert with `Number()` or `JSON.parse()` when you need other types. The data lives in the HTML, which keeps it visible and easy to pair with [[event-delegation|event delegation]].

Use `dataset` to attach an id or state to an element instead of inventing your own non-standard attributes.
