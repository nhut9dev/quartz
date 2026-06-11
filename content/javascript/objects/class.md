---
title: Class
description: Syntax for defining object blueprints with constructors and methods.
tags:
  - javascript
  - class
  - object
---

A **class** is syntax for creating a family of objects that share methods. The `constructor` runs when you call `new`, and methods are placed on the class prototype so instances can reuse them.

```js
class User {
  constructor(name) {
    this.name = name
  }

  greet() {
    return `Hello, ${this.name}`
  }
}

const user = new User("Nhut")

user.greet() // "Hello, Nhut"
```

Classes can define [[getter|getters]], [[setter|setters]], and [[private-field|private fields]]. They are useful when behavior belongs close to the data it operates on, but plain [[object|objects]] and functions are often enough for simple data.

Under the hood, JavaScript classes are built on prototypes. The class syntax is cleaner than manually assigning methods to `User.prototype`, but it does not turn JavaScript into a classical language like Java or C#.
