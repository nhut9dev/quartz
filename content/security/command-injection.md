---
title: Command injection
description: An attack where untrusted input is executed as an OS shell command.
tags:
  - security
---

**Command injection** occurs when untrusted input is passed into an operating system shell, letting an attacker run arbitrary commands.

It typically happens when an application builds a shell string from user data, for example to call an image converter or `ping` a host.

The strongest defense is to avoid shelling out at all and use a safe library API instead.

When you must run a process, pass arguments as a list rather than a single shell string, so the shell never parses user input.

As with [[sql-injection|SQL injection]], [[input-validation|input validation]] helps but is not the primary control.
