---
title: Channels
description: Typed conduits that let goroutines communicate and synchronize by passing values.
tags:
  - go
  - concurrency
---

A **channel** is a typed conduit through which [[goroutines|Goroutines]] send and receive values, encoding Go's motto: *don't communicate by sharing memory; share memory by communicating*.

## How it works

```go
ch := make(chan int)   // unbuffered
ch <- 1                // send
v := <-ch              // receive
```

An **unbuffered** channel blocks the sender until a receiver is ready, so it doubles as synchronization. A **buffered** channel (`make(chan int, 8)`) accepts values until the buffer is full, decoupling sender and receiver. `select` waits on several channel operations at once, taking whichever is ready first — the basis for timeouts and fan-in.

## When to use

Reach for channels to hand work to a pool of goroutines, to fan results back in, or to signal cancellation. For plain shared counters or maps, a `sync.Mutex` is often simpler and faster than routing every access through a channel.

## Pitfalls

If every goroutine is blocked waiting on channels, the runtime panics with a deadlock. Closing a channel signals "no more values"; sending on a closed channel panics, and you should close from the sender, never the receiver. Forgetting to drain a channel can leave goroutines blocked forever — a [[../concurrency/race-condition|race condition]] of timing, not memory.
