---
title: Code splitting
description: Breaking one large bundle into smaller chunks loaded on demand.
tags:
  - web
  - performance
  - build
---

**Code splitting** breaks one large bundle into smaller chunks that load on demand, instead of shipping your entire app up front. The browser downloads only what the first screen needs, then fetches the rest as the user navigates.

Splits are usually drawn along natural seams: per route, or per heavy feature like a chart library or a rich-text editor. The [[bundler]] sees a dynamic `import()` and emits a separate chunk for everything behind it.

The benefit is a smaller initial load, which means faster first paint and time-to-interactive. The tradeoff is extra network requests later, so split where it pays off rather than everywhere.

Code splitting pairs with [[lazy-loading]], which defers fetching a chunk until it is actually needed. Together they are a staple of any large [[spa]], where one monolithic bundle would otherwise block the first render.

## How it works

The bundler builds a dependency graph from `import` statements. Each dynamic `import()` marks a split point: the bundler emits everything reachable only through that import as a separate chunk file, rather than inlining it into the main bundle. At runtime, reaching that `import()` call triggers a network request for the chunk, and execution waits until it arrives.

## When to use

Route-based splitting is the default first cut — each page loads only its own code, and the initial bundle shrinks to whatever the first screen needs. Beyond that, split out features that are heavy but only sometimes used: a rich-text editor, a charting library, a modal that most users never open.

## Trade-offs

More chunks means a smaller initial download but more round trips and more files for the browser's cache to track and invalidate on each deploy. Splitting too finely can turn a single user interaction into a waterfall of small chunk requests, each adding latency, where one slightly larger chunk would have been faster overall.

## Pitfalls

A dependency shared by multiple chunks can get duplicated into each one unless the bundler's chunk-splitting configuration explicitly extracts shared vendor code into its own chunk — total download size grows even though the *initial* load looks smaller. The opposite mistake is splitting out something needed immediately, like above-the-fold content — that turns what could have been part of the first response into an extra network round trip on the critical path.
