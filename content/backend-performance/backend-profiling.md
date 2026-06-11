---
title: Backend profiling
description: Measuring where a running service spends time and memory to find hot paths.
tags:
  - performance
  - profiling
  - observability
---

**Backend profiling** measures where a process actually spends its time and memory, so optimization targets real bottlenecks instead of guesses.

## What to profile

CPU profiling answers "what code is running"; heap or allocation profiling answers "what is consuming memory and creating GC pressure". They find different problems — a service can be slow because of CPU-bound work, or because of allocation churn and garbage collection, and the two look nothing alike.

Equally important is the on-CPU vs off-CPU split. On-CPU profiling shows busy work; off-CPU profiling shows time spent *waiting* — on locks, I/O, DB calls, the event loop. Many backend stalls are off-CPU, so a pure CPU profile can look idle while requests are slow. For Node specifically, watch [[../node/event-loop-lag|event loop lag]].

## Sampling vs instrumentation

Sampling profilers interrupt the process periodically and record the stack; overhead is low and roughly constant, which makes them safe in production. Instrumentation wraps specific functions for exact counts and timings, but adds overhead that can distort the very thing being measured. Sample broadly first, instrument narrowly second.

## Doing it safely in production

Lab profiles rarely match production load, data, and cache state, so profile production when you can. Use a low sampling rate, prefer always-on continuous profilers built for it, and capture short windows. Render results as a [[flame-graph|flame graph]] to spot hot paths, and correlate with [[apm|APM]] traces to tie a slow span to the code that caused it.
