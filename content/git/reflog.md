---
title: Git reflog
description: A local history of where branch heads and HEAD have pointed.
tags:
  - git
---

**Git reflog** records recent movements of `HEAD` and branch references in your local repository.

```bash
git reflog
```

It is often used to recover [[commit|commits]] after an accidental reset, [[rebase]], or [[branch]] movement.

Reflog is local. It is not a collaboration history and usually expires after a configured period.
