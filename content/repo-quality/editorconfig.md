---
title: EditorConfig
description: A small configuration file that keeps basic editor formatting consistent across tools.
tags:
  - tooling
  - formatting
---

**EditorConfig** is a small configuration file that keeps basic editor formatting consistent across tools.

It usually controls indentation style, indentation size, line endings, final newlines, and trailing whitespace. It works at the editor layer, before [[../tooling/prettier|Prettier]] or [[../tooling/eslint|ESLint]] runs.

Use it for cross-editor defaults that should apply to all contributors, including files Prettier may not format.

EditorConfig is not a linter. It reduces accidental formatting drift but does not replace project checks.
