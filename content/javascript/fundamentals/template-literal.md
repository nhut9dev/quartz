---
title: Template literal
description: A string syntax that supports interpolation and multi-line text.
tags:
  - javascript
  - basics
  - string
---

A **template literal** is a string written with backticks. It can insert expressions with `${...}` and can span multiple lines.

```js
const name = "Nhut"
const message = `Hello, ${name}`

message // "Hello, Nhut"
```

Interpolation works with any [[expression|expression]], not just variables.

```js
const total = 10

`Total: $${total.toFixed(2)}`
```

Template literals are usually clearer than joining many small strings with `+`, especially when the output includes variables or readable multi-line text.
