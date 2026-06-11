---
title: Micro-frontend
description: Splitting a frontend into independently developed and deployed pieces owned by different teams.
tags:
  - frontend-architecture
---

**Micro-frontends** split one user-facing application into separate pieces that different teams can build, test, and deploy independently.

Each piece owns a slice of the UI, often a whole route or product area, with its own repository and release cadence.

The pieces are composed at runtime or build time, sometimes through [[module-federation|module federation]], an iframe, or server-side assembly.

The main benefit is team autonomy: teams ship without coordinating one giant release.

The tradeoff is operational and runtime cost. Shared dependencies, consistent styling, and a coherent [[design-system|design system]] become harder, and bundle duplication can hurt performance.

Use them only when team scaling pain is real, not for a single small app.
