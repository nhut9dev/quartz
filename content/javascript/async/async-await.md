---
title: async/await
description: Syntax for writing promise-based asynchronous code in a direct style.
tags:
  - javascript
  - async
---

`async/await` is syntax for working with [[promise|promises]] without chaining `.then()` calls. An `async` function always returns a promise, and `await` pauses that function until the awaited promise settles.

```js
async function loadUser(id) {
  const response = await fetch(`/api/users/${id}`)
  if (!response.ok) throw new Error("Failed to load user")
  return response.json()
}
```

## How it works

`await` doesn't block the runtime. It suspends the current function, returns control to the event loop, and resumes the function later — through the [[microtask-queue|microtask queue]] — once the promise settles. A rejected awaited promise throws at the `await`, so ordinary `try...catch` handles async errors the same way as synchronous ones.

## Sequential vs parallel

Each `await` waits for the previous one, which is correct for dependent steps but accidentally serializes independent work:

```js
const a = await getA() // these don't depend on each other,
const b = await getB() // yet b waits for a to finish
const [a, b] = await Promise.all([getA(), getB()]) // start both, then wait
```

## Pitfalls

`await` inside a `for` loop runs iterations one at a time — usually start the promises first and `await Promise.all` the array. Forgetting `await` gives you the pending promise object, not the value, and any rejection becomes unhandled. Awaiting a non-promise just wraps and resolves it, so a stray `await` is harmless but pointless.
