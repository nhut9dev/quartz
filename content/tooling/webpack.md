---
title: Webpack
description: A configurable JavaScript bundler for applications and libraries.
tags:
  - tooling
---

**Webpack** builds a dependency graph and [[bundler|bundles]] modules for the browser or other runtimes.

It supports loaders, plugins, [[code-splitting|code splitting]], asset handling, and many legacy build requirements.

Webpack is powerful and widely used, but configuration can become complex in large projects.

## How it works

Starting from configured entry points, Webpack builds a dependency graph by following every `import`/`require` it finds. Each module passes through any matching loaders — transforming syntax, CSS, images — before being added to the graph. Plugins hook into stages of this build lifecycle to do things loaders can't, like generating an HTML file or extracting CSS into separate files.

## When to use

Expect to find it (or reach for it) in legacy projects, or monorepos with bespoke asset pipelines that need plugin-level control over the bundling process. New projects increasingly default to [[vite|Vite]] or a framework's bundled tooling instead of configuring Webpack directly.

## Trade-offs

Webpack's loader/plugin architecture is more flexible than the opinionated defaults of Vite or esbuild — but that flexibility means two Webpack configs in different projects can behave completely differently, and a misconfigured rule produces no error, just silently-wrong output (a file that should've been transformed ships as-is).

## Pitfalls

[[../web/build/tree-shaking|Tree-shaking]] only works for ES modules and depends on `sideEffects` being correctly declared in `package.json` — one misdeclared dependency can pull its entire unused code into the bundle. Loader order matters and runs in reverse (right-to-left, bottom-to-top in an array), a common source of "it works if I reorder this" bugs. And without explicit [[../web/build/code-splitting|code splitting]] configuration, a Webpack app can ship as one large bundle that keeps growing, unnoticed, as dependencies are added.
