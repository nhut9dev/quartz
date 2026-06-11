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
