---
title: Custom element
description: A developer-defined HTML element registered with the browser.
tags:
  - html
  - web
---

A **custom element** is an HTML element name registered with JavaScript.

```js
customElements.define("user-card", UserCard)
```

Custom elements must include a hyphen in their name, such as `user-card`.

They are one part of the web components model and are useful when you want reusable elements understood directly by the browser.
