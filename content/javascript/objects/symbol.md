---
title: Symbol
description: A unique, immutable primitive often used as a non-colliding object key.
tags:
  - javascript
  - primitive
---

A **Symbol** is a [[primitive-type|primitive type]] whose every value is guaranteed unique, even when two symbols share the same description. That uniqueness makes them ideal as object keys that can never clash with another key.

```js
const id = Symbol("id")

const user = { name: "Nhut", [id]: 123 }

user[id] // 123
```

Because a symbol key is not a string, it stays hidden from `for...in` and `Object.keys`, so it won't collide with ordinary properties added elsewhere.

JavaScript also defines *well-known symbols* that hook into language behavior. The most common is `Symbol.iterator`, which marks an object as iterable and lets `for...of` find its [[iterator|iterator]].

```js
const obj = { [Symbol.iterator]() { /* ... */ } }
```

Use a symbol when you need a key that is unique and protected from accidental overwrite.
