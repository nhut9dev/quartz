---
title: Primitive type
description: A basic JavaScript value that is not an object.
tags:
  - javascript
  - basics
  - type
---

A **primitive** is a basic JavaScript value that is not an [[object|object]]. JavaScript has these primitive types: `string`, `number`, `boolean`, `null`, `undefined`, `bigint`, and `symbol`.

```js
const name = "Nhut"
const age = 20
const active = true
const missing = null
```

Primitives are compared by value.

```js
"a" === "a" // true
1 === 1 // true
```

This is different from [[reference-type|reference types]], where two objects with the same shape are still different values unless they are the exact same reference.
