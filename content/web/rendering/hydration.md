---
title: Hydration
description: Client-side React attaches listeners and state to server-rendered HTML to make it interactive.
tags:
  - web
  - rendering
  - react
---

**Hydration** is the step where client-side [[react-introduction|React]] takes over server-rendered HTML, attaching event listeners and wiring up state so static markup becomes interactive. The server already drew the page; hydration reuses that DOM instead of throwing it away and rebuilding it.

## How it works

React renders the same component tree on the client, but instead of creating DOM nodes it walks the existing server-rendered ones, matches them up, and attaches the handlers and state. This is what makes [[ssr|server-side rendering]] practical: the user sees content fast, then JavaScript loads and hydration "brings it to life." In pure [[csr|client-side rendering]] there's nothing to hydrate — React builds the DOM from scratch.

## The cost

Hydration isn't free. The browser must download and execute the component JavaScript before anything is interactive, creating a gap where the page *looks* ready but clicks do nothing — the "uncanny valley" of SSR. Bigger trees cost more. Techniques like progressive and selective hydration, islands, and [[react-server-components|React Server Components]] exist to shrink or skip this work by sending less client JavaScript.

## Pitfalls

The server and client must render identical output; if they disagree React warns and may discard and [[re-render|re-render]] the markup, causing flicker. Event handlers are dead until hydration completes, so an early click is lost. The usual mismatch causes are rendering `Date.now()`, random values, or browser-only checks during the initial render — keep the first client render identical to the server's.
