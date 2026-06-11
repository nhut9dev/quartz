---
title: PATH environment
description: The environment variable that tells the shell where to find executable commands.
tags:
  - linux
  - shell
---

`PATH` is a colon-separated list of directories the shell searches when you type a command.

If a command works in one terminal but not another, check which shell profile was loaded and whether the executable directory appears in `PATH`.

Order matters. If two directories contain a command with the same name, the first match wins. That can be useful for tooling, but risky when an unexpected binary shadows the intended one.
