---
title: Process
description: A running instance of a program identified by a PID, with a parent and an exit status.
tags:
  - linux
---

A **process** is a running instance of a program, identified by a numeric PID and tracked by the kernel.

Every process has a parent that started it, forming a tree from the first `init` process down. Each one carries its own memory, open files, and environment.

When a process finishes it returns an **exit status**: zero means success, non-zero means an error. Parents read this code to decide what to do next.

A process can be paused, resumed, or asked to stop through a [[signal|signal]]. The [[shell|shell]] launches processes for each command you run.

This model keeps programs isolated, so one crash does not take down the rest.
