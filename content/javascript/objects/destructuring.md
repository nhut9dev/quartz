---
title: Destructuring
description: Syntax for unpacking values from arrays and objects.
tags:
  - javascript
  - syntax
---

**Destructuring** pulls values out of an [[array|array]] or [[object|object]] into local variables.

```js
const user = { id: 1, name: "Ada" }
const { id, name } = user

const point = [10, 20]
const [x, y] = point
```

Object destructuring matches by property name. Array destructuring matches by position.

It is common in function parameters, React [[props|props]], API responses, and hooks like `const [count, setCount] = useState(0)`. Keep it shallow unless the shape is very stable; deeply nested destructuring can make code harder to scan.
