---
title: Context performance
description: How React context updates can cause broad re-rendering, and how to contain it.
tags:
  - react
  - performance
---

**Context performance** is about controlling how many components re-render when a context value changes.

[[react-context|Context]] has no selector. When a provider's value changes identity, *every* consumer re-renders, regardless of which part of the value it actually reads. That is fine for stable, rarely-changing data, but it makes context a poor fit for fast-changing state shared by many components.

## How it works

A consumer subscribes to the whole context, not a slice of it. React compares the provided value by reference (`Object.is`); if it differs from last render, all consumers are scheduled to re-render. So a provider that builds a fresh object every render — `value={{ user, setUser }}` — invalidates every consumer on each parent render, even when nothing meaningful changed.

## Fixes

Split contexts so unrelated concerns don't share a re-render — a common split is value vs. updater, since the setter is stable and many components only need it. Memoize the provider value with [[use-memo|useMemo]] so its identity is stable across renders. Move state down closer to the components that use it so fewer subtrees subscribe. When many components need to read *different slices* of frequently-changing state, use a store ([[state-management/zustand|Zustand]], Redux, Jotai) built on [[hooks/use-sync-external-store|useSyncExternalStore]], which gives each component a selective subscription.

## Pitfalls

Don't put high-frequency state (mouse position, form keystrokes, scroll) in a wide context. Watch for the inline-object trap above — it silently defeats memoization downstream. And measure before refactoring: the [[react-profiler|Profiler]] shows whether context is actually the cause or just a suspect.
