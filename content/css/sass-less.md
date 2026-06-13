---
title: Sass / Less
description: CSS preprocessors that compile variables, nesting, and mixins to plain CSS.
tags:
  - css
  - tooling
---

**Sass** and **Less** are CSS preprocessors — supersets of CSS compiled to plain CSS, adding variables, nesting, mixins, functions, and imports that weren't always available natively.

## How it works

A compiler parses the `.scss`/`.less` source, resolves variables, mixins, and imports, and emits plain `.css`. Nesting (`.card { .title { ... } }`) compiles to flattened selectors (`.card .title`); mixins compile to repeated property blocks; `@import`/`@use` are inlined into a single output file.

## When to use

Reach for Sass/Less in codebases that already use them — large legacy stylesheets, older design systems — or when a feature genuinely needs preprocessor-only capabilities: mixins with logic (loops, conditionals over many variants) or math beyond `calc()`. For new projects, most of what preprocessors offered — [[css-variable|CSS variables]], native nesting, `@media` ranges — now has a native CSS equivalent, so plain CSS with [[postcss|PostCSS]] or [[../tailwind/index|Tailwind]] often covers the same ground without a compile step.

## Trade-offs

Preprocessor variables resolve at build time into static CSS — they can't change at runtime the way [[css-variable|CSS custom properties]] can, e.g. for a dark mode toggled by a class. A codebase that needs runtime-themeable values typically needs CSS variables regardless of whether it also uses Sass.

## Pitfalls

Deep nesting (`.a .b .c .d span`) compiles to high-[[specificity|specificity]] selectors that are hard to override later — a preprocessor convenience that creates a cascade problem down the line. Sass's `@import` is deprecated in favor of `@use`/`@forward`, which have different scoping rules (no global namespace pollution) — migrating an `@import`-heavy codebase can surface naming collisions that `@import` had been silently allowing.
