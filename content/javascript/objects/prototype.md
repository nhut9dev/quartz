---
title: Prototype
description: JavaScript's object delegation mechanism.
tags:
  - javascript
  - object
  - class
---

A **prototype** is an object that another object can delegate property lookups to. If JavaScript can't find a property directly on an object, it walks up the prototype chain.

```js
const user = { name: "Nhut" }
user.toString // found on Object.prototype, not on user
```

## The prototype chain

Every object has an internal link to its prototype. A property read checks the object's own keys first, then its prototype, then that prototype's prototype, and so on until it reaches `Object.prototype` and finally `null`. The first match wins. Writing a property, by contrast, sets it directly on the object — it doesn't travel up the chain — which is why assignment can *shadow* an inherited property rather than change it.

## Classes are sugar over prototypes

[[class|Classes]] don't add a new inheritance model; they're ergonomics over this one. Methods declared in a class live on the prototype and are shared by every instance, not copied onto each one.

```js
class User {
  sayHi() { return "hi" }
}
const u = new User()
Object.getPrototypeOf(u) === User.prototype // true
```

## Pitfalls

Mutating a built-in prototype like `Array.prototype` affects every array in the program and breaks `for...in` and library code — don't. Because `for...in` walks inherited enumerable keys too, use `Object.hasOwn(obj, key)` (or `Object.keys`) when you mean only own properties. And very long chains or `Object.setPrototypeOf` on hot objects hurt lookup performance.
