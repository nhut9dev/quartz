---
title: Prefetch and preload
description: Browser hints for loading resources earlier.
tags:
  - performance
  - html
---

**Preload** asks the browser to fetch a resource needed for the current page soon.

**Prefetch** hints that a resource may be useful for a future navigation.

These hints can improve perceived speed when used for [[critical-rendering-path|critical resources]], but overuse competes with more important downloads.

Use them based on real loading behavior, not as a blanket optimization.
