---
title: Context package
description: Go's standard way to carry cancellation, deadlines, and request-scoped values across API boundaries.
tags:
  - go
  - concurrency
---

A **`context.Context`** carries cancellation signals, deadlines, and request-scoped values across function calls and [[goroutines|Goroutines]], so related work can be stopped together.

## How it works

A `Context` is passed as the first argument down a call chain. Deriving a child context returns a `cancel` function and a `Done()` channel that closes when the context is cancelled or its deadline passes:

```go
ctx, cancel := context.WithTimeout(ctx, 2*time.Second)
defer cancel()
rows, err := db.QueryContext(ctx, query)
```

Cancellation propagates: cancelling a parent cancels every derived child, so a single client disconnect can unwind a whole tree of goroutines, database queries, and outbound HTTP calls.

## When to use

Thread a context through any request-scoped operation — handlers, RPCs, database and HTTP calls — to enforce timeouts and to abort work when the caller goes away. It is also the backbone of [[../node/graceful-shutdown|graceful shutdown]]: cancel a root context on `SIGTERM` and in-flight work drains cleanly.

## Pitfalls

Always call `cancel`, even on success, or you leak the timer and goroutine behind the context. Don't store a `Context` in a struct — pass it explicitly. And `context.Value` is for request-scoped data like trace IDs, not a substitute for passing real function parameters.
