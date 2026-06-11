---
title: Git cherry-pick
description: Applying one specific commit from another branch onto the current branch.
tags:
  - git
---

**Git cherry-pick** copies the changes introduced by a specific [[commit]] onto the current [[branch]].

```bash
git cherry-pick <commit>
```

It is useful for backporting fixes, moving one small change without [[merge|merging]] an entire branch, or recovering a commit from another line of work.

Cherry-pick creates a new commit with a different hash. Use it deliberately so history does not accidentally duplicate the same logical change.
