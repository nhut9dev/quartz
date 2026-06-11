---
title: Setter
description: A method that runs when you assign to a property, validating before storing.
tags:
  - javascript
  - class
  - object
---

A **setter** is the mirror of a [[getter|getter]]: a function that runs when you *assign* to a property, defined with the `set` keyword. The value on the right-hand side of the `=` arrives as its argument, giving you a chance to validate or normalize it before anything is stored.

```js
class User {
  #name = ""

  get name() {
    return this.#name
  }

  set name(value) {
    if (!value) throw new Error("name cannot be empty")
    this.#name = value.trim()
  }
}

const u = new User()

u.name = "  Nhut  " // setter runs, stores "Nhut"
```

To the caller it still looks like a normal assignment, but the function decides what actually happens. Setters are almost always backed by a [[private-field|private field]] holding the real state, so the public property stays validated while the internal value stays hidden.
