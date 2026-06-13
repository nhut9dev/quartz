---
title: Islands architecture
description: Shipping mostly static HTML with small independently hydrated interactive islands.
tags:
  - frontend-architecture
---

**Islands architecture** ships a page as mostly static HTML, with only small interactive regions, the "islands", hydrated with JavaScript.

Each island hydrates independently, so the rest of the page stays static and cheap to render.

This contrasts with full [[../web/csr|client-side rendering]], where the whole page becomes one large interactive app that must fully [[../web/hydration|hydrate]].

The benefit is performance: less JavaScript to download and execute, which helps [[performance-budget|performance budgets]] and [[../web/core-web-vitals|Core Web Vitals]].

The tradeoff is that highly interactive, app-like pages with shared state across the whole screen do not map cleanly onto isolated islands.

## How it works

The server renders the full page as static HTML, including the markup for what will become interactive regions. Each island is annotated with when it should hydrate — immediately, when it scrolls into view, or when the browser is idle (Astro's `client:load`/`client:visible`/`client:idle` are the canonical examples). Only that island's component code and framework runtime is shipped and executed; everything else on the page stays plain HTML with no JavaScript attached to it at all — there's no single hydration pass over the whole document.

## When to use

Islands fit content-heavy pages with a few isolated interactive widgets — a search box and a comment form on an otherwise static blog or marketing site. They fit poorly for pages that are themselves one interactive application — a dashboard where most of the visible UI shares state and re-renders together is better served by a single hydrated app than by trying to decompose it into independently-hydrating islands.

## Trade-offs

The win is shipping and executing JavaScript only for the parts of the page that need it, instead of hydrating the entire document — often the largest lever for [[performance-budget|performance budget]] and [[../web/core-web-vitals|Core Web Vitals]] on content sites. The cost is that islands are isolated render roots by design: there's no shared component tree or context connecting them, so anything that needs to coordinate across islands (an "add to cart" button updating a cart-count badge elsewhere on the page) needs an explicit channel — a shared store, custom events, or URL state — that a single hydrated app would get from context for free.

## Pitfalls

Picking the wrong hydration trigger is a common, easy-to-miss UX bug: a `client:idle` or `client:visible` island that's actually needed immediately (a primary CTA button) appears in the HTML, looks ready, but doesn't respond to clicks until its JS loads and hydrates — "the button is there but does nothing" for a brief but noticeable window right after page load. Cross-island state is the other recurring issue: it's easy to build the first island, then discover a second island needs to react to the first one's state, and there's no built-in mechanism for that — it has to be designed in from the start (a shared lightweight store or event bus), not bolted on per pair of islands.
