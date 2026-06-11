---
title: Rebase
description: Replaying commits from one Git branch onto another base commit.
tags:
  - git
---

A **rebase** replays [[commit|commits]] from one [[branch]] on top of another base commit.

```bash
git rebase main
```

Rebasing can make history linear and easier to read. It rewrites commit history, so it should be used carefully on branches that other people may already be using.

Use [[merge|merge]] when preserving branch history is more important than a linear history.
