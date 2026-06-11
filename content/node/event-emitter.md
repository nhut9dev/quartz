---
title: EventEmitter
description: A Node.js pattern for sending and handling named events inside a process.
tags:
  - node
---

An **EventEmitter** lets one part of a Node.js program publish a named event while other parts subscribe to it, without the sender knowing every receiver in advance. Streams, servers, and many core APIs are built on it.

```js
emitter.on("ready", () => console.log("ready"))
emitter.emit("ready")
```

## How it works

`emit` calls every registered listener **synchronously**, in registration order, before returning. `on` adds a listener, `once` auto-removes after the first call, and `off` removes one — but only if you kept a reference to the exact function. Because emission is synchronous, a listener that throws propagates the error back to the `emit` caller.

## The error event

The `'error'` event is special: if you emit `'error'` and no listener is registered, Node throws and **crashes the process**. Every emitter that can fail must have an error listener — this is the most common way a stream or socket takes down a server.

## Pitfalls

Node warns at more than 10 listeners on one event; treat it as a likely leak (forgotten `off`) rather than bumping the limit. Anonymous listeners can't be removed, so long-lived subscriptions need named references. And leaning on events for core business flow makes control flow hard to trace when listeners depend on hidden ordering — use them for decoupled lifecycle signals, not as a substitute for [[../javascript/promise|promises]] in a linear sequence.
