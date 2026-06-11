---
title: Rendering strategy
description: Choosing among CSR, SSR, SSG, and ISR per route based on its needs.
tags:
  - frontend-architecture
---

**Rendering strategy** is the decision of how each route produces its HTML, choosing per route rather than for the whole app.

Use [[../web/csr|CSR]] for private, highly interactive screens where SEO and first paint matter less.

Use [[../web/ssr|SSR]] when content is personalized or changes per request and must arrive rendered.

Use [[../web/ssg|SSG]] for stable content that can be built once and served from a CDN.

Use [[../web/isr|ISR]] to keep static pages fast while refreshing them on a schedule.

The benefit is matching cost and freshness to each page. The tradeoff is complexity: a mixed app needs clear rules and consistent [[../web/code-splitting|code splitting]] to avoid confusion.
