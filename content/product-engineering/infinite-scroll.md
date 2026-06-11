---
title: Infinite scroll
description: Loading more content as the user reaches the end of a list.
tags:
  - product-engineering
  - frontend
---

**Infinite scroll** loads more content as the user approaches the end of a list.

It works well for feeds and discovery surfaces where users browse without a fixed target. It is weaker for admin tables, search results that need stable positions, and tasks that require footer access.

Good infinite scroll needs stable sorting, cursor pagination, loading indicators, error recovery, and scroll position preservation.

It is usually backed by [[../api-design/pagination-strategy|cursor pagination]] and often uses [[../dom/intersection-observer|IntersectionObserver]].
