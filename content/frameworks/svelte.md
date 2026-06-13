---
title: Svelte
description: A compiler that turns components into vanilla JS with no virtual DOM.
tags:
  - frameworks
  - svelte
---

**Svelte** is a compiler, not a runtime framework — components are compiled at build time into JS that directly manipulates the DOM, with no virtual DOM and, in pre-5 versions, almost no framework runtime shipped to the browser.

## How it works

The Svelte compiler analyzes each component's reactive variables (`let count = 0` plus an assignment like `count += 1`) and generates code that directly updates the specific DOM nodes that depend on `count` — there's no diffing, because the compiler already knows at build time which DOM updates correspond to which state changes. Svelte 5 introduces **runes** (`$state`, `$derived`, `$effect`) — an explicit, signals-based reactivity API that replaces the earlier compiler-inferred reactivity from bare assignments.

## When to use

Svelte fits projects prioritizing small bundle size and runtime performance, since compiled output has no virtual-DOM diffing overhead and (pre-runes) shipped very little framework code. Its ecosystem — routing, state management — is smaller than React's, so expect fewer ready-made integrations for niche needs.

## Trade-offs

Compiling the framework away gives close to the smallest possible runtime cost — but it also ties Svelte's behavior to its compiler version more tightly than a typical library. Upgrading across major versions, especially the runes rewrite in Svelte 5, can be a bigger migration than a typical React version bump, which mostly preserves the same component model release to release.

## Pitfalls

Pre-runes Svelte's reactivity worked by compiler analysis of assignments — `array.push(item)` doesn't trigger an update because it's a mutation, not an assignment, while `array = [...array, item]` does. This "reassign, don't mutate" rule is invisible unless you know the compiler is specifically watching for `=`. Runes (Svelte 5) make reactivity explicit via `$state`, closer to how Vue's `ref`/`reactive` or [[signals|signals]] work elsewhere — but it's a different mental model from both earlier Svelte and from React's `useState`.
