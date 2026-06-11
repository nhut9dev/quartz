---
title: Array
description: An ordered list-like object used to store indexed values.
tags:
  - javascript
  - array
---

An **array** stores ordered values by index. Indexes start at `0`, and `length` tells you how many items are in the array.

```js
const names = ["An", "Binh", "Chi"]

names[0] // "An"
names.length // 3
```

Arrays have mutable methods like `push`, `pop`, `shift`, `unshift`, `sort`, and `splice`, which change the original array. They also have methods commonly used for [[immutable-operation|immutable operations]], such as [[array-map|map()]], [[array-filter|filter()]], [[array-reduce|reduce()]], `slice`, and `toSorted`.

```js
const nextNames = [...names, "Dung"]
```

Use arrays when order matters, when you need to iterate through items, or when the data naturally behaves like a list.
