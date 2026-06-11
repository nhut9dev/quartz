---
title: Polyfill
description: Code that implements a newer runtime feature in environments that lack it.
tags:
  - web
  - tooling
---

**A polyfill** is code that implements a newer browser or runtime feature in environments that do not have it natively. It checks whether the API exists and, if not, defines a working stand-in, so older browsers gain the missing capability at runtime.

For example, a polyfill might add `Promise`, `fetch`, or `Array.prototype.flat` to a browser too old to ship them. Once loaded, your code calls the API normally and cannot tell the difference.

This is distinct from a [[transpiler]], which rewrites *syntax* into a form older engines can parse. A transpiler cannot conjure a missing API out of thin air; that is a runtime gap only a polyfill can fill. The two are complementary: transpile the syntax, polyfill the features.

Polyfills are often pulled in automatically based on your target browsers, and bundled alongside your app by the [[bundler]].
