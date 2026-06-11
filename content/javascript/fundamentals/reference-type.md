---
title: Reference type
description: A value accessed through a reference, such as an object, array, or function.
tags:
  - javascript
  - basics
  - type
---

A **reference type** is a value that variables access through a reference. Objects, arrays, and functions are reference values.

```js
const a = { name: "Nhut" }
const b = a

b.name = "An"

a.name // "An"
```

`a` and `b` point to the same [[object|object]], so changing through one variable is visible through the other. This differs from [[primitive-type|primitive values]], which are compared by value.

```js
{} === {} // false
[] === [] // false
```

Reference behavior is why shallow copies, immutable updates, and `structuredClone` matter when working with nested data.
