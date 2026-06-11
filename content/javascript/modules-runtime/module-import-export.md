---
title: import and export
description: JavaScript module syntax for sharing values between files.
tags:
  - javascript
  - module
---

`import` and `export` let JavaScript files share functions, objects, classes, and constants through modules.

```js
// math.js
export function add(a, b) {
  return a + b
}

// app.js
import { add } from "./math.js"
```

Named exports are imported with braces and keep their exported names. A file can also have one default export, which the importing file can name locally.

Modules make dependencies explicit. They also give [[bundler|bundlers]] enough structure to split code, remove unused exports through [[tree-shaking|tree shaking]], and build browser-ready files.
