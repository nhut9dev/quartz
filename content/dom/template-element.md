---
title: template element
description: An HTML element that holds inert markup for cloning later.
tags:
  - dom
  - html
---

The `template` element stores markup that is not rendered immediately.

JavaScript can clone its content and insert it into the DOM later.

```html
<template id="row-template">
  <li></li>
</template>
```

It is useful for small browser-native rendering patterns and web components.
