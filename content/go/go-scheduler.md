---
title: Go scheduler
description: The runtime scheduler that multiplexes goroutines onto OS threads using the GMP model.
tags:
  - go
  - concurrency
---

The **Go scheduler** is the user-space scheduler that maps many [[goroutines|Goroutines]] onto a few OS threads, so concurrency stays cheap.

## How it works

It uses the **GMP model**: **G** is a goroutine, **M** is an OS thread (machine), and **P** is a logical processor — a context holding a run queue of goroutines. An M must hold a P to execute Gs. The number of Ps is set by `GOMAXPROCS`, defaulting to the number of CPU cores, which caps how many goroutines run truly in parallel.

Each P keeps its own local run queue. When a P empties its queue it performs **work-stealing**, grabbing goroutines from another P's queue to stay busy and balance load. If a goroutine blocks on a syscall, its M detaches and the P is handed to another M so the remaining goroutines keep running.

## Pitfalls

Early Go relied on cooperative scheduling — a tight CPU loop with no function calls could starve others. Modern Go adds **asynchronous preemption**, interrupting long-running goroutines so they yield. Setting `GOMAXPROCS` too high in a container with a CPU limit causes excess context switching; align it with the actual CPU quota.
