---
title: Multi-page application
description: Each route is a separate HTML document served by the server, with a full reload on navigation.
tags:
  - web
  - architecture
---

**A multi-page application (MPA)** treats each route as its own HTML document served by the server. Navigating to a new page triggers a full browser reload: the server returns fresh HTML, and the browser discards the old page and renders the new one.

This is the traditional web model, and it stays simple. There's no client router or shared in-memory state to manage, and each URL maps to a real document. It's also SEO-friendly by default, since every route returns complete HTML that crawlers read directly, much like [[ssr|server-side rendering]] produces per request.

The cost is that full reloads feel less fluid than in-app transitions, and any client state is lost on navigation unless persisted.

Contrast this with a [[spa|single-page application]], which loads once and swaps views in JavaScript for smoother navigation at the expense of first-load and SEO setup.
