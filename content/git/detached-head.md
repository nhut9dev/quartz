---
title: Detached HEAD
description: A Git state where HEAD points directly to a commit instead of a branch.
tags:
  - git
---

**Detached HEAD** means `HEAD` points directly at a [[commit]] instead of a [[branch]] name.

This often happens when checking out a [[tag]], old commit, or commit hash.

You can inspect and test safely in this state. If you create new commits and want to keep them, create a branch before moving away.

```bash
git switch -c my-branch
```
