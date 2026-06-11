---
title: Layout and template
description: Next.js App Router files for shared route UI and remounted route UI.
tags:
  - nextjs
---

In the [[app-router|App Router]], a **layout** wraps route segments and preserves state across navigation.

A **template** also wraps route segments but remounts on navigation.

Use layouts for persistent shells such as navigation, sidebars, and [[react-context|providers]]. Use templates when each navigation needs a fresh instance.
