---
title: Flame graph
description: A visualization of stack samples that shows where a program spends its time.
tags:
  - performance
  - profiling
  - visualization
---

A **flame graph** visualizes profiler stack samples as stacked bars where each box is a function, the y-axis is call-stack depth, and the **width is the time spent** in that function and its children.

## How to read it

Width is the only thing that matters — wide boxes are where time goes; tall stacks are just deep call chains, not slow ones. The x-axis is *not* time order; frames are sorted alphabetically so identical stacks merge into one wide box. Scan for the widest leaf frames near the top: those are the functions actually burning CPU (or, for an off-CPU graph, actually waiting).

## Differential flame graphs

A differential flame graph colors each frame by how much it grew or shrank between two profiles — for example before and after a deploy, or a fast vs slow tenant. It turns "the service got slower" into "this specific function now takes 3x longer", which is far faster than eyeballing two separate graphs.

## When to use

Reach for a flame graph once [[backend-profiling|profiling]] tells you a process is hot but not *where*. It is the standard way to render CPU, allocation, or off-CPU samples, and pairs well with [[apm|APM]] when a trace shows a slow span and you need to drill into the code path behind it.
