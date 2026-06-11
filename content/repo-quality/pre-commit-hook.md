---
title: Pre-commit hook
description: A Git hook that runs before a commit is created.
tags:
  - git
  - tooling
---

**Pre-commit hook** is a Git hook that runs before a commit is created.

It is best for fast checks that protect the next commit: formatting staged files, linting staged files, checking generated files, or preventing obvious secrets. In JavaScript repositories it often runs [[lint-staged|lint-staged]] through [[husky|Husky]].

Pre-commit should optimize for speed. If it runs a full test suite every time, developers will either wait too long or skip it.

Use [[../deployment/ci|CI]] for the non-skippable version of important checks.
