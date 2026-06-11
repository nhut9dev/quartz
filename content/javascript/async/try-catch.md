---
title: try...catch
description: JavaScript syntax for handling thrown errors.
tags:
  - javascript
  - error
---

`try...catch` lets code handle an error instead of letting it crash the current flow. Code inside `try` runs normally; if it throws, control moves to `catch`.

```js
try {
  const data = JSON.parse(input)
  console.log(data.name)
} catch (error) {
  console.error("Invalid JSON", error)
}
```

With [[async-await|async/await]], `try...catch` can also handle rejected promises.

```js
try {
  const user = await loadUser()
} catch (error) {
  showError(error)
}
```

Use it at boundaries where the program can recover, show a fallback, retry, or report the failure. Do not catch errors just to ignore them.
