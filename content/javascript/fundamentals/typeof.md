---
title: typeof
description: An operator that returns a string describing a value's type.
tags:
  - javascript
  - basics
  - type
---

`typeof` is an operator that returns a string describing the broad type of a value.

```js
typeof "hello" // "string"
typeof 123 // "number"
typeof true // "boolean"
typeof undefined // "undefined"
typeof function () {} // "function"
```

One famous JavaScript quirk is `typeof null`:

```js
typeof null // "object"
```

That result is historical behavior, not a good mental model. Treat `null` as its own intentional empty value. For arrays, use `Array.isArray(value)` instead of `typeof`, because arrays are objects.
