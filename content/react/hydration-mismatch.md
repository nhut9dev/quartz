---
title: Hydration mismatch
description: A divergence between server-rendered HTML and the first client render.
tags:
  - react
  - web
---

A **hydration mismatch** happens when the server-rendered HTML does not match what React produces on its first client render during [[../web/hydration|hydration]].

## Why it happens

In [[../web/ssr|SSR]], the server sends finished HTML and React then "hydrates" it — reusing the existing DOM and only attaching event handlers, on the assumption that its first client render is byte-for-byte identical. When the two diverge, React can't trust the server DOM: it discards the affected markup and re-renders on the client, which means warnings, lost event wiring, and visible flicker.

## Common causes

The usual culprits are values that simply differ between the two environments: browser-only APIs read during render (`window`, `localStorage`, `matchMedia`), time- or randomness-dependent output (`Date.now()`, `Math.random()`), locale or timezone formatting, feature flags resolved differently per side, and invalid HTML nesting that the browser silently "fixes" before React sees it.

## Fixes

Keep the first client render identical to the server's, then change things in an effect. Read browser-only state after mount — a `useState(false)` flag flipped to `true` in [[use-effect|useEffect]] — so the dynamic branch only appears on the client. Use [[hooks/use-id|useId]] for ids that must match across server and client. For output that is *intentionally* different (a live timestamp), set `suppressHydrationWarning` on that element rather than suppressing globally. This is most relevant in [[../nextjs/server-component|Server Components]] and Next.js apps.
