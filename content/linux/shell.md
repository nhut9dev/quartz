---
title: Shell
description: The command interpreter that reads typed commands and runs them.
tags:
  - linux
---

A **shell** is the command interpreter that reads what you type, expands it, and runs the corresponding programs. Common shells include `bash`, `zsh`, and `fish`.

It is both an interactive prompt and a scripting language. You run commands, then capture the same commands in a script for repeatable work.

The shell handles globbing, variable expansion, and quoting before a program ever sees its arguments. Shell-level variables differ from a runtime's, such as Node's [[../node/environment-variable|environment variables]].

It wires programs together using [[pipe-and-redirection|pipes and redirection]] over the [[standard-streams|standard streams]].

The tradeoff: shells are quick for glue, but tricky for complex logic where a real language is clearer.
