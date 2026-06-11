---
title: Husky
description: A tool for managing Git hooks inside JavaScript and TypeScript repositories.
tags:
  - tooling
  - git
---

**Husky** is a tool for managing Git hooks inside JavaScript and TypeScript repositories.

### How it works

Git hooks are scripts that run at lifecycle points such as before commit or before push. Husky stores hook scripts in `.husky/` so they can be committed and shared by the team.

Common hooks run [[lint-staged|lint-staged]] at pre-commit and [[commitlint|commitlint]] at commit-msg. Husky should support local feedback, while [[../deployment/ci|CI]] remains the authoritative gate.

### When to use

Use Husky when a team wants consistent local hooks without asking every developer to manually configure `.git/hooks`.

### Trade-offs

Hooks catch problems early, but they can be skipped with `--no-verify` and can break in GUI clients or unusual Node environments. Keep them fast and reproducible.

### Pitfalls

Do not put every quality gate in Git hooks. Expensive, flaky, or environment-sensitive checks belong in CI.
