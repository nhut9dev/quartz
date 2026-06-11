---
title: lint-staged
description: A tool that runs linters and formatters only on files staged for commit.
tags:
  - tooling
  - git
---

**lint-staged** runs linters and formatters only on files staged for a Git commit.

It keeps [[pre-commit-hook|pre-commit hooks]] fast by avoiding full-repository checks. A common setup runs [[../tooling/prettier|Prettier]] on staged text files and [[../tooling/eslint|ESLint]] on staged JavaScript or TypeScript files.

Use lint-staged for cheap, deterministic checks that can safely modify staged files. Keep slower checks such as full test suites, full typecheck, or production builds in [[../deployment/ci|CI]] or a [[pre-push-hook|pre-push hook]].

The pitfall is overloading pre-commit with long tasks. If committing feels slow, developers will skip hooks or batch unrelated work.
