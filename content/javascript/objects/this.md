---
title: this
description: A value set by how a function is called, not where it is written.
tags:
  - javascript
  - object
  - function
---

`this` is not decided by where a function is written. For regular functions it is decided by **how the function is called** — the call site.

```js
const user = {
  name: "Nhut",
  sayHi() {
    return this.name
  },
}

user.sayHi() // "Nhut" — called as a method on user
```

## The call-site rules

For a regular function, resolve `this` by how it's invoked: called with `new`, it's the new instance; called via [[bind-call-apply|call, apply, or bind]], it's the object you passed; called as `obj.fn()`, it's `obj`; called plain as `fn()`, it's `undefined` in strict mode (the global object otherwise). Arrow functions ignore all of this — they have no `this` of their own and capture it lexically from the enclosing scope.

## Losing `this`

The method binding is not attached to the function; it's decided fresh at each call. Detaching a method drops it:

```js
const sayHi = user.sayHi
sayHi() // undefined — call site is now a plain call
```

The same happens when you pass a method as a callback (`setTimeout(user.sayHi)`, an event handler). Fix it by binding (`user.sayHi.bind(user)`) or wrapping in an arrow that keeps the receiver (`() => user.sayHi()`).

## Pitfalls

Using an arrow function as an object method is usually wrong — it captures the *outer* `this`, not the object. In classes, passing a method to JSX or an event handler without binding (or defining it as an arrow class field) leaves `this` undefined when it later runs.
