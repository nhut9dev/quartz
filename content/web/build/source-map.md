---
title: Source map
description: A file that maps minified or transpiled output back to your original source.
tags:
  - web
  - tooling
  - debugging
---

**A source map** is a file that maps minified or transpiled output back to your original source code. When DevTools loads it, the debugger shows your real files, variable names, and line numbers instead of the compressed bundle the browser actually runs.

Without it, a production error points to something like `bundle.min.js:1:48210`, which is useless. With it, the same error resolves to `Cart.tsx:42`, exactly where you wrote the code.

Source maps are generated automatically by the [[bundler]] and the [[transpiler]] as they emit output, recording how each transformed position relates to the original. They are typically referenced by a trailing comment in the output file.

They exist precisely because steps like [[minification]] and transpilation make the shipped code unreadable. The map restores a debugging experience that matches your source, while the browser still benefits from the optimized output.
