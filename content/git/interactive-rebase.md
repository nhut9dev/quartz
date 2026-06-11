---
title: Interactive rebase
description: Editing, reordering, squashing, or dropping commits before sharing history.
tags:
  - git
---

**Interactive rebase** is a form of [[rebase]] that lets you rewrite a sequence of [[commit|commits]].

```bash
git rebase -i HEAD~5
```

It can reorder commits, edit commit messages, combine commits, or remove accidental commits.

Use it mostly on local or personal [[branch|branches]]. Rewriting commits that teammates already depend on can disrupt collaboration.
