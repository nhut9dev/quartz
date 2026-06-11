---
title: Client-side rendering
description: The browser downloads a JS bundle and renders the UI in the browser.
tags:
  - web
  - rendering
---

**Client-side rendering (CSR)** sends the browser a near-empty HTML shell plus a JavaScript bundle; React then builds and renders the entire UI in the browser. The server stays simple and cheap, mostly handing out static files.

The upside is rich interactivity: once the bundle loads, navigation and updates happen instantly without round-trips. The downside is first paint. Until the [[bundler|bundle]] downloads, parses, and runs, the user stares at a blank page, and crawlers that don't execute JavaScript see little content, which hurts [[seo|SEO]].

CSR is the default of a plain Vite + React [[spa|single-page app]]: one HTML file boots the whole application client-side.

Contrast this with [[ssr|server-side rendering]], where the server produces ready-to-show HTML and the client only [[hydration|hydrates]] it. Reach for CSR when interactivity matters more than first paint or discoverability, such as dashboards behind a login.
