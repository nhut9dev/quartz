---
title: Iterator
description: An object that produces a sequence of values one at a time via next().
tags:
  - javascript
  - protocol
---

An **iterator** is an object with a `next()` method that returns `{ value, done }` on each call, where `done` becomes `true` once the sequence is exhausted. An object is *iterable* when it has a `Symbol.iterator` method returning such an iterator — that is the protocol `for...of` consumes.

```js
const range = {
  *[Symbol.iterator]() {
    yield 1
    yield 2
    yield 3
  },
}

for (const n of range) {
  // 1, 2, 3
}
```

Built-ins like [[array|Array]], [[map|Map]], and [[set|Set]] are already iterable, which is why they work with `for...of` and spread. A [[generator|generator]] is the easiest way to author your own iterator without writing `next()` by hand.

Use the protocol when you want a value to be looped over or spread.
