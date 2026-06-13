---
title: PostCSS
description: A plugin-based tool that transforms CSS, powering autoprefixing and Tailwind.
tags:
  - css
  - tooling
---

**PostCSS** transforms CSS through plugins — not a preprocessor language itself, but the engine behind autoprefixing, Tailwind's compilation, and modern CSS feature polyfills.

## How it works

PostCSS parses CSS into an AST, runs it through a pipeline of plugins that each transform the AST — adding vendor prefixes, converting modern syntax to compatible output, inlining Tailwind's `@tailwind` directives into generated utility classes — then prints the result back to CSS. Each plugin does one focused transform; a project's `postcss.config.js` chains the ones it needs.

## When to use

Most projects use PostCSS indirectly: Tailwind, Next.js, and most build tools already run a PostCSS pipeline with autoprefixing and minification configured. Reach for it directly when a specific transform is needed — polyfilling a new CSS feature for older browsers via `postcss-preset-env`, or a custom plugin for project-specific class-name transforms.

## Trade-offs

Because PostCSS plugins operate on the CSS AST individually, they compose — autoprefixing, nesting, custom media queries, and Tailwind's utility generation can all run in the same pipeline. But each added plugin sits in the build's critical path, and a misconfigured or outdated plugin can silently change output in ways that go unnoticed until a specific browser breaks.

## Pitfalls

Autoprefixing (`autoprefixer`) is driven by a `browserslist` config — a stale list (still targeting old browsers no one uses) ships unnecessary vendor-prefixed CSS that bloats the bundle, while a list that's too narrow means real users on older browsers see unstyled or broken layouts. Plugin order also matters and isn't enforced automatically: a plugin expecting already-flattened CSS needs to run after the nesting plugin, and getting the order wrong produces output that looks fine until a specific selector pattern hits it.
