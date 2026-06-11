---
title: Transpiler
description: A tool that rewrites source code into equivalent code at the same level of abstraction.
tags:
  - web
  - tooling
  - build
---

**A transpiler** is a tool that rewrites source code into equivalent code at the same level of abstraction. For example, it turns [[jsx|JSX]], TypeScript, or modern JavaScript into widely-supported JavaScript that older environments understand. Common transpilers include `Babel`, `SWC`, `esbuild`, and `tsc`.

This is different from a traditional compiler, which lowers code to machine code or bytecode. A transpiler stays in the same world: source in, source out.

It is also different from a [[polyfill]]. A transpiler rewrites *syntax* (arrow functions, optional chaining, JSX tags), while a polyfill adds missing *runtime features* (like `Promise` or `fetch`) that no amount of rewriting can produce.

In practice a transpiler runs as a step inside your [[bundler]], so authoring in modern or non-standard syntax still ships code every target browser can run.
