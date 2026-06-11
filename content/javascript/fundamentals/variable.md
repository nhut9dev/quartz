---
title: Variable
description: A named binding that points to a value.
tags:
  - javascript
  - basics
---

A **variable** is a named binding to a value. JavaScript gives you three declaration keywords: `const`, `let`, and `var`.

```js
const name = "Nhut"
let count = 0
var legacy = true
```

Prefer `const` by default because it prevents reassignment. Use `let` when the binding must point to a different value later. Avoid `var` in modern code because it is function-scoped, can be redeclared, and behaves differently under [[hoisting|hoisting]].

```js
const user = { name: "Nhut" }

user.name = "An" // allowed: the object changed
user = {} // TypeError: the binding cannot be reassigned
```

`const` protects the variable binding, not the contents of an [[object|object]] or array.
