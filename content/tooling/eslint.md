---
title: ESLint
description: A JavaScript and TypeScript linter for finding code issues and enforcing rules.
tags:
  - tooling
---

**ESLint** checks JavaScript and TypeScript code against configured rules.

It can catch bugs, risky patterns, unused variables, dependency issues, and project style violations.

Modern ESLint projects usually use [[../repo-quality/eslint-flat-config|ESLint flat config]]. TypeScript projects commonly add [[../repo-quality/typescript-eslint|typescript-eslint]] for parsing and TypeScript-aware rules.

ESLint is best for correctness and code-quality rules. Formatting is usually handled by [[prettier|Prettier]] or [[../repo-quality/biome|Biome]].
