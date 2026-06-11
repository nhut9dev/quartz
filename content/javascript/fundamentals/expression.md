---
title: Expression
description: A piece of JavaScript code that produces a value.
tags:
  - javascript
  - basics
---

An **expression** is any piece of code that evaluates to a value. Literals, arithmetic, comparisons, function calls, property access, and ternaries are all expressions.

```js
1 + 2
"hello".toUpperCase()
user.name
age >= 18 ? "adult" : "minor"
```

Expressions can be placed wherever JavaScript expects a value.

```js
const total = price * quantity
const label = user.name.toUpperCase()
```

The difference from a [[statement|statement]] is that an expression produces a value, while a statement performs an instruction. This distinction helps when reading arrow functions, JSX, template literals, and conditional logic.
