---
title: Strict Mode
description: A React development tool for surfacing unsafe rendering and effect patterns.
tags:
  - react
  - debugging
---

**Strict Mode** is a React development-only tool that helps find code that is not safe for React's rendering model. It does not change production behavior.

In development, Strict Mode may intentionally run render and effect setup more than once. This exposes components that depend on accidental one-time behavior, mutate during render, or forget [[effect-cleanup|effect cleanup]].

Strict Mode is closely tied to [[purity|purity]]. If rendering is pure and effects clean up after themselves, extra development checks should not break the component.

## How it works

In development only, Strict Mode makes React deliberately do things twice that should be idempotent if your code follows the rules: it calls component render functions twice per render (and throws away one result, to surface impure renders that mutate shared state or rely on call-count), and for every effect it runs **setup → cleanup → setup** on mount instead of just **setup** — simulating what would happen if the component were unmounted and remounted. State initializer functions passed to `useState`/`useReducer` are also called twice for the same reason. None of this happens in production builds; it's purely a development-time amplifier for bugs that would otherwise only show up occasionally (e.g. under fast remounts, or with React's concurrent features).

## When to use

Enable it everywhere in development — it's on by default in Vite/CRA/Next.js's default templates for exactly this reason. It costs nothing in production (the extra invocations are stripped) and the bugs it surfaces (missing [[effect-cleanup|effect cleanup]], state initializers with side effects, non-idempotent render) are bugs that exist regardless of whether Strict Mode catches them — it just catches them now instead of in production under concurrent rendering or fast remounts.

## Trade-offs

The double-invocation makes development logs and network tabs noisier — every effect's setup appears to run twice, every `console.log` in render appears twice — which is disorienting until you know why. The payoff is that effects which "worked" only because they happened to run exactly once (a subscription that's never cleaned up, a counter incremented in a state initializer) fail loudly in development instead of leaking resources or double-counting in production under conditions that are harder to reproduce.

## Pitfalls

Third-party libraries or older code that assume an effect's setup runs exactly once — opening a singleton connection, registering a global listener without a matching cleanup — break under Strict Mode's double-invoke, which surfaces as duplicated subscriptions or "already initialized" errors that don't exist in production. The most common false alarm is "my API is being called twice" during development — this is almost always Strict Mode's intentional double effect run on mount, not a real duplicate-request bug; the actual fix (if the request has side effects, like a POST) is to make the effect idempotent or move the call out of an effect, not to disable Strict Mode.
