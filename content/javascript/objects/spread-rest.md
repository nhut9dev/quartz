---
title: Spread and rest
description: JavaScript syntax for expanding or collecting values with three dots.
tags:
  - javascript
  - syntax
---

`...` has two related meanings. **Spread** expands values out. **Rest** collects values in.

```js
const next = [...items, newItem]
const user = { ...baseUser, name: "Ada" }

function sum(...numbers) {
  return numbers.reduce((total, n) => total + n, 0)
}
```

Spread is common for [[immutable-operation|immutable updates]] because it creates a new array or object instead of changing the original one.

Rest appears in function parameters and destructuring patterns. It gathers the remaining values into an array or object so code can handle a flexible shape.
