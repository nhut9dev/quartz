---
title: typescript-eslint
description: Tooling that lets ESLint parse TypeScript and apply TypeScript-aware rules.
tags:
  - eslint
  - typescript
---

**typescript-eslint** is tooling that lets [[../tooling/eslint|ESLint]] parse TypeScript and apply TypeScript-aware rules.

It provides a parser, plugin rules, and shared configs for TypeScript projects. Some rules only need syntax; type-aware rules need TypeScript type information and are slower but catch deeper issues.

Use type-aware linting for important source files when it catches bugs that TypeScript alone does not express well. Keep generated files, build output, and sometimes tests on lighter rules if performance becomes painful.

The common pitfall is treating ESLint and `tsc` as the same check. TypeScript verifies types; ESLint enforces code-quality patterns, unsafe constructs, imports, promises, hooks, and project conventions.
