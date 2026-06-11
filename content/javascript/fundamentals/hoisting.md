---
title: Hoisting
description: JavaScript's compile-time setup of declarations before code runs.
tags:
  - javascript
  - function
  - scope
---

**Hoisting** describes how JavaScript prepares declarations before executing a scope, so some names are usable before the line that declares them.

## How it works

Before running a scope, the engine scans it and allocates its bindings. How each binding behaves until its declaration line differs by kind. A **function declaration** is fully available — body and all — so you can call it earlier in the file. A **`var`** is allocated and initialized to `undefined`, so reading it early gives `undefined` rather than an error. **`let` and `const`** are allocated too, but left uninitialized in the *temporal dead zone* (TDZ); reading them before the declaration throws.

```js
sayHi() // works — function declaration
function sayHi() { console.log("hi") }

console.log(count) // undefined — var is hoisted, assignment is not
var count = 1

console.log(total) // ReferenceError — let is in the TDZ
let total = 1
```

## Pitfalls

A function *expression* assigned to a `var` is not callable early — only the `var` is hoisted (as `undefined`), not the function, so calling it throws "not a function". Relying on hoisting to call things defined later reads as a bug to most reviewers. The TDZ is a feature, not an annoyance: it's the main reason modern code prefers `let` and `const` over `var`, since it catches use-before-declare instead of silently yielding `undefined`.
