---
title: Pipe and redirection
description: Connecting command output to input with a pipe, and redirecting streams to and from files.
tags:
  - linux
---

**Pipes and redirection** route data between commands and files instead of always going through the screen and keyboard.

A pipe `|` connects one command's output to the next command's input, so `ps | grep node` filters a listing. This lets you build pipelines from small tools.

Redirection points a stream at a file: `>` writes (overwriting), `>>` appends, and `<` feeds a file in as input. You can target a specific stream, like `2>` for errors.

Together they embody the Unix idea of composing tiny programs over the [[standard-streams|standard streams]].

The [[shell|shell]] sets these connections up before each [[process|process]] starts.
