---
title: Benchmarking
description: Measuring the performance of code in a controlled, repeatable way.
tags:
  - performance
  - testing
  - benchmarking
---

**Benchmarking** measures how fast a piece of code or system runs under controlled, repeatable conditions, so changes can be compared with confidence.

## Micro vs macro

A microbenchmark times a small unit — a function, a serializer, a hot loop. A macrobenchmark times a realistic end-to-end path under load and is closer to [[load-testing|load testing]]. Microbenchmarks are precise but easy to make meaningless; macrobenchmarks are noisier but far more representative. Most "X is faster than Y" claims come from microbenchmarks that never survive contact with production.

## Pitfalls

- **Warmup / JIT** — managed runtimes (JVM, V8) start interpreted and compile hot paths over time. Measuring cold skews results; always warm up and discard early iterations.
- **Dead-code elimination** — the compiler may delete work whose result is unused, so a loop that "computes" nothing gets benchmarked as instant. Consume the result (return it, sum it, sink it) to keep it alive.
- **Statistical noise** — a single run is worthless. Report a distribution across many iterations, pin CPU frequency where possible, and compare medians, not lucky minimums.
- **Unrealistic data** — sorted inputs, tiny payloads, or fully cached state flatter the code. Use data shaped like production.

## Tradeoffs

A benchmark is a model, not production. It isolates one variable and strips away contention, cold caches, real traffic patterns, and the tail. Use it to compare alternatives and catch regressions in CI, but validate the winner under real load and watch [[latency-percentiles|percentiles]] — a faster median can hide a worse tail.
