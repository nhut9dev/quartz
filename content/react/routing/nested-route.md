---
title: Nested route
description: A route rendered inside another route's layout.
tags:
  - react
  - routing
---

A **nested route** renders inside a parent route layout. This is useful when multiple pages share navigation, sidebars, tabs, or data boundaries.

```txt
/settings/profile
/settings/billing
/settings/security
```

The parent `/settings` route can own the shared layout, while children render the specific page content.

Nested routing keeps route structure close to UI structure.
