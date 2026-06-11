---
title: Single-page application
description: One HTML document where navigation swaps views in JavaScript without full reloads.
tags:
  - web
  - architecture
---

**A single-page application (SPA)** loads one HTML document and then handles navigation in JavaScript, swapping views in place instead of fetching a new page from the server. A client router intercepts link clicks, updates the URL, and renders the next view without a full reload.

This gives smooth, app-like transitions and preserves in-memory state between screens, since the page never reloads. A [[react-introduction|React]] app served by Vite is a typical SPA.

The tradeoffs show up at the edges. The first load must download the JavaScript before anything renders (see [[csr|client-side rendering]]), so initial paint is slower, and crawlers receiving an empty shell make SEO harder unless you add server rendering.

Contrast this with an [[mpa|multi-page application]], where the server returns a fresh HTML document for every route and the browser fully reloads on each navigation.
