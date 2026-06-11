---
title: Statement
description: A JavaScript instruction that performs an action.
tags:
  - javascript
  - basics
---

A **statement** is an instruction JavaScript executes. It does something: declares a variable, branches with `if`, loops with `for`, returns from a function, or throws an error.

```js
const name = "Nhut"

if (name) {
  console.log(name)
}
```

Statements are the building blocks of program flow. They are different from [[expression|expressions]], which produce values.

```js
const message = name ? "Hello" : "Missing name"
```

Here the whole `const` line is a statement, while `name ? "Hello" : "Missing name"` is an expression because it resolves to a value.
