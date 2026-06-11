---
title: Repository quality
description: Notes about linting, formatting, Git hooks, commit rules, and automated checks for a healthy codebase.
tags:
  - tooling
  - repository
  - index
---

**Repository quality** is the set of local and automated checks that keep a codebase consistent, reviewable, and safe to change.

The common stack is [[../tooling/eslint|ESLint]] for code rules, [[../tooling/prettier|Prettier]] or [[biome|Biome]] for formatting, [[lint-staged|lint-staged]] for changed files, [[husky|Husky]] for Git hooks, [[commitlint|commitlint]] for commit messages, and [[../deployment/ci|CI]] for the source of truth.

## Code Checks

- [[eslint-flat-config|ESLint flat config]]
- [[typescript-eslint|typescript-eslint]]
- [[lint-staged|lint-staged]]
- [[editorconfig|EditorConfig]]
- [[biome|Biome]]

## Git Hooks

- [[husky|Husky]]
- [[pre-commit-hook|Pre-commit hook]]
- [[pre-push-hook|Pre-push hook]]

## Commit Rules and Releases

- [[conventional-commits|Conventional Commits]]
- [[commitlint|commitlint]]
- [[changesets|Changesets]]
