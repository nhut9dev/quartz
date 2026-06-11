---
title: Bundler
description: A tool that combines many JS modules and assets into a few optimized files for the browser.
tags:
  - web
  - tooling
  - build
---

**A bundler** is a build tool that follows your `import` graph and combines many JavaScript modules and assets into a few optimized files the browser can load efficiently. Common bundlers include `Vite`, `esbuild`, `Rollup`, and `webpack`.

Browsers can load native ES modules, but shipping hundreds of tiny files over the network is slow. A bundler resolves every import, stitches the modules together, and emits a small set of files with predictable load order.

Along the way it enables key optimizations: [[tree-shaking]] drops code you never import, [[code-splitting]] breaks output into on-demand chunks, and [[minification]] shrinks what remains. Many bundlers also run a [[transpiler]] step so newer or non-standard syntax becomes widely-supported JavaScript.

Reach for a bundler when your app grows past a handful of files, or whenever you need production builds that load quickly.
