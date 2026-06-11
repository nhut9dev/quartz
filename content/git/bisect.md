---
title: Git bisect
description: A binary search through commit history to find the commit that introduced a bug.
tags:
  - git
---

**Git bisect** helps find the commit that introduced a regression.

You mark one known good [[commit]] and one known bad commit. Git checks out commits between them until the first bad commit is found.

```bash
git bisect start
git bisect bad
git bisect good <commit>
```

Bisect is most powerful when the bug can be checked quickly with a test or repeatable command.
