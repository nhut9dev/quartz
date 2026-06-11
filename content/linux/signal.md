---
title: Signal
description: An asynchronous notification the kernel delivers to a process, such as SIGTERM or SIGKILL.
tags:
  - linux
---

A **signal** is an asynchronous notification the kernel delivers to a [[process|process]], interrupting it to request or force an action.

`SIGTERM` politely asks a process to shut down, giving it a chance to clean up. `SIGKILL` forces an immediate stop and cannot be caught or ignored.

Other common ones include `SIGINT` from pressing Ctrl-C and `SIGHUP` when a terminal closes. The `kill` command sends them by PID.

Most signals can be handled: a program registers a handler to flush data or release resources before exiting gracefully.

This is the standard way to control long-running processes from the [[shell|shell]] or another program.
