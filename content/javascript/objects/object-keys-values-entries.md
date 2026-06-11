---
title: Object.keys, values, and entries
description: Read an object's own enumerable properties as arrays.
tags:
  - javascript
  - object
---

`Object.keys`, `Object.values`, and `Object.entries` turn an [[object|object]]'s own enumerable properties into an [[array|array]], so you can iterate them with array methods or `for...of`. `keys` gives property names, `values` gives the values, and `entries` gives `[key, value]` pairs.

```js
const user = { name: "Nhut", age: 30 }

Object.keys(user) // ["name", "age"]
Object.values(user) // ["Nhut", 30]
Object.entries(user) // [["name", "Nhut"], ["age", 30]]
```

`entries` pairs well with destructuring in a loop, and round-trips through `Object.fromEntries` after a transform:

```js
for (const [key, value] of Object.entries(user)) {
  // "name" -> "Nhut", "age" -> 30
}
```

All three skip inherited and symbol-keyed properties. Use them when you need to loop over, map, or filter an object's contents as data.
