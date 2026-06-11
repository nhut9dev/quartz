---
title: Conventional Commits
description: A structured commit message convention that makes history machine-readable.
tags:
  - git
  - release
---

**Conventional Commits** is a structured commit message convention that makes Git history human-readable and machine-readable.

### How it works

A commit starts with a type, optional scope, and description:

```text
feat(auth): add passkey login
fix(api): handle expired refresh tokens
docs: update deployment guide
```

`feat` signals a feature, `fix` signals a bug fix, and `!` or a `BREAKING CHANGE:` footer signals a breaking change. Other common types include `docs`, `refactor`, `test`, `build`, `ci`, `chore`, `style`, and `perf`.

### When to use

Use Conventional Commits when commit messages drive changelogs, version bumps, release notes, or consistent review history. It pairs with [[commitlint|commitlint]], [[changesets|Changesets]], and [[../web/semantic-versioning|Semantic Versioning]].

### Trade-offs

The convention improves automation and scanning, but it adds classification overhead. Teams need clear type definitions or people will debate `chore` vs `build` vs `ci` instead of the change.

### Pitfalls

Do not hide unrelated changes under one broad type. If a commit needs multiple unrelated labels, split it into multiple [[../git/commit|commits]].
