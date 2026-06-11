---
title: Getter
description: A method that runs when you read a property, computing the value on access.
tags:
  - javascript
  - class
  - object
---

A **getter** is a function that runs when you *read* a property, defined with the `get` keyword. Instead of storing a value, you compute it on the spot — yet callers still reach it like an ordinary property, with no parentheses.

```js
class Circle {
  constructor(radius) {
    this.radius = radius
  }

  get area() {
    return Math.PI * this.radius ** 2
  }
}

new Circle(2).area // 12.566… — looks like a field, runs like a method
```

The value is recomputed on every access; nothing is cached unless you cache it yourself. Getters behave the same inside a plain [[object|object]] literal as in a [[class|class]], and they pair naturally with a [[setter|setter]] when the property should also be writable.
