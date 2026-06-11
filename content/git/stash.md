---
title: Git stash
description: Temporarily shelves uncommitted changes so the working tree can be reused.
tags:
  - git
---

**Git stash** stores local uncommitted changes away from the working tree.

It is useful when you need to switch [[branch|branches]], [[fetch-pull-push|pull changes]], or inspect another state without committing unfinished work.

```bash
git stash
git stash pop
```

Use stash for short interruptions. For longer-lived work, a real [[branch]] and [[commit]] history are easier to review and recover.
