---
title: Vite
description: A frontend build tool and dev server optimized for fast development.
tags:
  - tooling
  - frontend
---

**Vite** is a frontend build tool with a fast dev server and production [[bundler|bundling]].

During development, it serves source modules through [[module-import-export|native ESM]] and transforms files on demand.

For production, Vite typically uses Rollup under the hood.

It is common in React, Vue, Svelte, and library projects.

## How it works

The dev server doesn't bundle — it serves each module as native ESM over HTTP and transforms files on demand with esbuild, including pre-bundling dependencies into single files so the browser doesn't issue hundreds of small requests for a package's internals. The production build switches to Rollup, which does full bundling, tree-shaking, and code-splitting.

## When to use

Default choice for new frontend projects — SPAs, component libraries, anything where fast dev-server startup and instant module updates matter more than fine-grained control over the bundling pipeline.

## Trade-offs

Using esbuild for dev and Rollup for production means dev and prod don't run through identical code paths — usually invisible, but it means a bug can appear in only one of the two, and "works in dev" isn't a guarantee it works in the production bundle.

## Pitfalls

CommonJS-only dependencies can break the native-ESM dev server and need special handling (`optimizeDeps.include` or a CJS interop plugin). `import.meta.env` values are inlined at build time, so changing an environment variable requires a rebuild, not just a server restart. The dependency pre-bundle cache (`node_modules/.vite`) can go stale after a dependency upgrade, producing a confusing "still running the old version" bug until the cache is cleared.
