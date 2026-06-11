---
title: Changesets
description: A release workflow for recording version and changelog intent alongside code changes.
tags:
  - release
  - tooling
---

**Changesets** is a release workflow for recording version and changelog intent alongside code changes.

Developers add small changeset files that describe affected packages, version bump level, and release notes. This is common in libraries and monorepos where multiple packages may release independently.

Use Changesets when release notes need human judgment instead of being inferred only from [[conventional-commits|Conventional Commits]].

The pitfall is treating changesets as busywork. They are most useful when package consumers need clear upgrade information.
