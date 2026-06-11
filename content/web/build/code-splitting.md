---
title: Code splitting
description: Breaking one large bundle into smaller chunks loaded on demand.
tags:
  - web
  - performance
  - build
---

**Code splitting** breaks one large bundle into smaller chunks that load on demand, instead of shipping your entire app up front. The browser downloads only what the first screen needs, then fetches the rest as the user navigates.

Splits are usually drawn along natural seams: per route, or per heavy feature like a chart library or a rich-text editor. The [[bundler]] sees a dynamic `import()` and emits a separate chunk for everything behind it.

The benefit is a smaller initial load, which means faster first paint and time-to-interactive. The tradeoff is extra network requests later, so split where it pays off rather than everywhere.

Code splitting pairs with [[lazy-loading]], which defers fetching a chunk until it is actually needed. Together they are a staple of any large [[spa]], where one monolithic bundle would otherwise block the first render.
