---
title: Standard streams
description: The default input, output, and error channels stdin, stdout, and stderr.
tags:
  - linux
---

The **standard streams** are the three default I/O channels every [[process|process]] receives: `stdin`, `stdout`, and `stderr`.

`stdin` is where a program reads input, usually the keyboard. `stdout` is where it writes normal results. `stderr` is a separate channel for errors and diagnostics.

Keeping output and errors apart matters: you can capture results while still seeing problems, or log each to a different place.

Each stream has a number (0, 1, 2) used when wiring things together with [[pipe-and-redirection|pipes and redirection]].

This shared convention is what lets unrelated tools connect, since every program speaks the same three channels under the [[shell|shell]].
