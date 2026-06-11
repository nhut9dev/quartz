---
title: WebAssembly
description: A portable binary instruction format that runs near-native code in the browser alongside JavaScript.
tags:
  - web
  - performance
---

**WebAssembly** (Wasm) is a portable binary instruction format that runs in the browser at near-native speed. Languages like C, C++, and Rust compile to a compact `.wasm` module that the browser's engine executes in the same sandbox as JavaScript. It is not a replacement for JavaScript but a companion: JS handles the DOM and glue while Wasm handles compute-heavy work.

```js
const { instance } = await WebAssembly.instantiateStreaming(fetch('app.wasm'))
```

Typical uses are image and video processing, codecs, cryptography, games, physics, and porting existing native libraries to the web. Because it ships as a predictable binary, it parses and starts faster than equivalent large JavaScript. It also runs outside the browser via WASI. Reach for WebAssembly when a hot path is genuinely CPU-bound; for ordinary UI logic, plain JavaScript is simpler and fast enough.
