---
title: Pre-push hook
description: A Git hook that runs before local commits are pushed to a remote.
tags:
  - git
  - tooling
---

**Pre-push hook** is a Git hook that runs before local commits are pushed to a remote.

It can run slower checks than [[pre-commit-hook|pre-commit]], such as typecheck, focused tests, or a package build. The goal is to catch failures before opening a pull request.

Use pre-push sparingly. It is still local and skippable, so [[../deployment/ci|CI]] must remain the final gate.

The common failure is duplicating the full CI pipeline locally and making every push painful.
