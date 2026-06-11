---
title: Minification
description: Shrinking JS/CSS by removing whitespace and shortening names without changing behavior.
tags:
  - web
  - tooling
  - build
---

**Minification** shrinks JavaScript or CSS by removing whitespace and comments and shortening local variable names, all without changing how the code behaves. The result is smaller files that download and parse faster.

For example, `const userCount = items.length;` might become `const a=items.length;`. The logic is identical; only the bytes change. Only local names are renamed, since renaming public APIs would break callers.

This step is usually handled automatically by the [[bundler]] during a production build, so you write readable code and ship compact code.

Minification pairs naturally with [[tree-shaking]]: tree-shaking removes whole chunks you never import, then minification squeezes what is left. Because the output no longer resembles your source, generate a [[source-map]] so DevTools can still show original names and line numbers when you debug.
