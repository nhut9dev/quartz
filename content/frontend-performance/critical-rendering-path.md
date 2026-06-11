---
title: Critical rendering path
description: The browser work needed to turn HTML, CSS, and JavaScript into pixels.
tags:
  - performance
  - web
---

The **critical rendering path** is the sequence of work a browser performs to render a page.

It includes parsing HTML, building the DOM, loading CSS, building the CSSOM, running blocking JavaScript, creating layout, painting, and compositing.

Performance improves when critical resources are smaller, fewer, [[caching|cached]], and loaded in the right order.
