---
title: Goroutines
description: Lightweight, cheap concurrent functions managed by the Go runtime rather than the OS.
tags:
  - go
  - concurrency
---

A **goroutine** is a function running concurrently, scheduled by the Go runtime rather than the operating system, so it is far cheaper than an OS thread.

## How it works

You start one by prefixing a call with `go`:

```go
go handleRequest(conn)
```

Each goroutine begins with a tiny (~2 KB) stack that grows and shrinks on demand, so a single process can run hundreds of thousands of them. The [[go-scheduler|Go scheduler]] multiplexes these goroutines onto a small pool of OS threads, switching between them at safe points without a full kernel context switch.

## vs OS threads vs worker threads

An OS thread reserves megabytes of stack and costs a kernel switch to schedule, so you have thousands at most. Goroutines are managed in user space and are orders of magnitude lighter. Unlike Node's [[../node/worker-threads|worker threads]] — separate V8 isolates that pass copied messages — goroutines share the same address space and communicate over [[channels|Channels]], which is cheaper but means you must guard shared state.

## Pitfalls

A goroutine leaks if it blocks forever (e.g. on a channel nobody writes to); leaked goroutines pile up unnoticed. The `main` function does not wait for goroutines, so a program can exit before they finish — coordinate with a `sync.WaitGroup` or channels. And sharing memory without synchronization invites a [[../concurrency/race-condition|race condition]].
