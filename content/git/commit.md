---
title: Commit
description: A saved snapshot of changes in a Git repository.
tags:
  - git
---

A **commit** is a saved snapshot of changes in a Git repository. Each commit has an identifier, author, timestamp, message, and pointer to previous history.

Good commits are small enough to review and explain. The message should describe the reason for the change, not just the files that changed.

Teams often standardize commit messages with [[../repo-quality/conventional-commits|Conventional Commits]] and enforce them with [[../repo-quality/commitlint|commitlint]].

Commits form the project history that [[branch|branches]], [[merge|merges]], [[pull-request|pull requests]], and releases are built from.
