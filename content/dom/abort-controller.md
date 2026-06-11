---
title: AbortController
description: Cancelling async work like fetch requests through a shared signal.
tags:
  - dom
  - control
---

An **AbortController** lets you cancel in-flight async work. It exposes a `signal` you hand to an API, and calling `abort()` flips that signal, telling the operation to stop.

```js
const controller = new AbortController();
fetch("/data", { signal: controller.signal })
  .catch((err) => { if (err.name === "AbortError") return; });
controller.abort();   // cancels the request above
```

The [[fetch-api|Fetch API]] rejects with an `AbortError` when its signal fires, so you can clean up or ignore the result. The same signal also works as the `signal` option in [[add-event-listener|addEventListener]], which removes the listener automatically when you abort.

Use it to cancel a stale request when inputs change, or to tear down listeners and timers together with one call.
