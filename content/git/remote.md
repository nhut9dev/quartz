---
title: Git remote
description: A named connection to another Git repository.
tags:
  - git
---

A **Git remote** is a named reference to another repository, usually on a hosting service.

`origin` commonly points to the repository cloned from.

```bash
git remote -v
git fetch origin
git push origin main
```

Remotes support collaboration by letting local [[branch|branches]] exchange [[commit|commits]] with shared repositories.
