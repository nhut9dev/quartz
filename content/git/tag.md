---
title: Git tag
description: A named pointer to a specific commit, commonly used for releases.
tags:
  - git
---

A **Git tag** names a specific [[commit]].

Tags are commonly used for [[semantic-versioning|release versions]] such as `v1.4.0`.

```bash
git tag v1.4.0
git push origin v1.4.0
```

[[branch|Branches]] move as new commits are added. Tags are intended to stay fixed, which makes them useful for marking published versions.
