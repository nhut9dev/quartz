---
title: ESLint flat config
description: The modern ESLint configuration format based on eslint.config files and config arrays.
tags:
  - eslint
  - tooling
---

**ESLint flat config** is the modern ESLint configuration format based on `eslint.config.*` files and an exported array of config objects.

### How it works

Flat config puts configuration in files such as `eslint.config.js`, `eslint.config.mjs`, or `eslint.config.cjs`. Each config object can target files, set ignores, configure language options, load plugins, and define rules.

This model makes file-specific rules explicit. A project can apply one rule set to JavaScript, another to TypeScript, another to tests, and another to generated files. It pairs naturally with [[typescript-eslint|typescript-eslint]] for TypeScript projects.

### When to use

Use flat config for new ESLint setups and for projects migrating away from older `.eslintrc` style configuration.

### Trade-offs

Flat config is more explicit and composable, but migration can expose old plugin assumptions, ignore differences, and unclear rule ownership.

### Pitfalls

Avoid one giant config object for every file type. Split by file patterns so tests, scripts, source files, and generated files get rules that match how they are actually used.
