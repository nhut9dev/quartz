---
title: Promise
description: A JavaScript object that represents an asynchronous result.
tags:
  - javascript
  - async
---

A **Promise** represents a value that may be available later. It starts pending, then settles exactly once — either fulfilled with a value or rejected with an error — and never changes again.

```js
fetch("/api/user")
  .then(response => response.json())
  .then(user => console.log(user.name))
  .catch(error => console.error(error))
```

## States and chaining

Each `.then` returns a *new* promise, so calls chain. Whatever you return from a handler becomes the next promise's value; if you return a promise, the chain waits for it. This is what makes async work composable: a function returns a promise and lets the caller decide how to wait, chain, or handle errors, instead of threading callbacks through every layer.

## Error propagation

A rejection skips every `.then` until it reaches a `.catch`, much like a thrown exception skips to the nearest handler. Throwing inside a `.then` also rejects the chain. One `.catch` at the end therefore covers all the steps above it.

## Pitfalls

Forgetting to `return` inside a `.then` breaks the chain — the next step runs before the inner work finishes. A rejected promise with no `.catch` becomes an unhandled rejection. Running independent promises in series wastes time; start them together and use `Promise.all` (or `Promise.allSettled` when you want every result regardless of failures). Most code now uses [[async-await|async/await]] on top, but the underlying model is still promises, and their callbacks run through the [[microtask-queue|microtask queue]], not synchronously on the current [[call-stack|call stack]].
