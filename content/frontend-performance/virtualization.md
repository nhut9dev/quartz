---
title: Virtualization
description: Rendering only the visible portion of a large list or grid.
tags:
  - performance
  - frontend
---

**Virtualization** keeps large lists fast by rendering only visible items and a small buffer.

It is useful for tables, logs, feeds, chat histories, and select menus with many options.

Virtualization reduces DOM size, layout work, and [[memory-leak|memory use]].

It adds complexity around measurement, keyboard navigation, scrolling, and dynamic item heights.
