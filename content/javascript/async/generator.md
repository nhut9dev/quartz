---
title: Generator
description: A function that can pause and resume, producing a sequence of values lazily.
tags:
  - javascript
  - function
---

A **generator** is a function declared with `function*` that can pause at each `yield` and resume later. Calling it does not run the body; it returns an [[iterator|iterator]] whose `next()` advances to the following `yield` and hands back that value.

```js
function* counter() {
  yield 1
  yield 2
  yield 3
}

const it = counter()
it.next() // { value: 1, done: false }
it.next() // { value: 2, done: false }
```

Because values are produced one at a time, generators are well suited to lazy or even infinite sequences — nothing is computed until you ask for the next item. The paused state keeps local variables alive between calls, much like a [[closure|closure]].

Reach for a generator when you need to model a stream or a custom iterable that `for...of` can consume on demand.
