---
title: CommonJS vs ESM
description: The two main JavaScript module systems used in Node.js.
tags:
  - node
  - javascript
---

**CommonJS** (CJS) uses `require()` and `module.exports`; **ESM** uses `import` and `export`. Modern Node.js runs both, but they have different mechanics, and mixing them creates friction.

## How they differ

CJS loads modules **synchronously** at runtime — `require()` is a function you can call conditionally, and `__dirname`/`require` exist everywhere. ESM is **static**: imports are hoisted and resolved before execution, which enables tree-shaking, live bindings, and top-level `await`, but means you can't conditionally import without the async `import()`. Node decides a file's mode from `"type"` in [[package-json|package.json]] or the `.mjs`/`.cjs` extension.

## Interop

ESM can import a CJS module's `module.exports` as its default export; named imports from CJS work only when Node can statically detect them, so they're best-effort. The other direction is harder: CJS cannot `require()` an ESM module (it's async) and must use dynamic `import()`. `__dirname` and `require` don't exist in ESM — use `import.meta.url` and `createRequire`.

## Pitfalls

The **dual-package hazard** — shipping both CJS and ESM builds — can load your library twice with two separate module states. ESM import specifiers need the file extension (`./util.js`, not `./util`). You can't mix `require` and `import` in one file. For new packages ESM is now the default; many older libraries still ship CJS only.
