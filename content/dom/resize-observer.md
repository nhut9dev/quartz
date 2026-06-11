---
title: ResizeObserver
description: A browser API for reacting when an element's size changes.
tags:
  - dom
  - css
---

**ResizeObserver** calls a callback when an observed element changes size.

It is useful for charts, canvas layouts, virtualized views, and components that need exact measured dimensions.

Use CSS features such as [[../css/container-query|container queries]] when styling alone is enough.

Reserve ResizeObserver for JavaScript behavior that genuinely needs element measurements.
