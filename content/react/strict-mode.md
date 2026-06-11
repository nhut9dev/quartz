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
