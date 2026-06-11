---
title: Private field
description: A class field that can only be accessed inside the class body.
tags:
  - javascript
  - class
  - object
---

A **private field** starts with `#` and can only be read or written inside the [[class|class]] that declares it. It is real language-level privacy, not a naming convention.

```js
class Counter {
  #count = 0

  increment() {
    this.#count += 1
    return this.#count
  }
}

const counter = new Counter()

counter.increment() // 1
counter.#count // SyntaxError
```

Private fields are useful when you want a public API to stay small while internal state remains protected. They pair naturally with a [[getter|getter]] or [[setter|setter]] when outside code should read or write through a controlled property instead of touching the raw value.
