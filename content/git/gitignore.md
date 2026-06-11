---
title: .gitignore
description: A file that tells Git which untracked files to ignore.
tags:
  - git
---

`.gitignore` lists file patterns Git should ignore when they are untracked.

Common ignored files include build output, dependency folders, editor files, logs, and local environment files.

```gitignore
node_modules/
dist/
.env
```

`.gitignore` does not remove files already tracked by Git, meaning files already part of the [[commit]] history. A tracked file must be removed from the index before ignore rules apply to it.
