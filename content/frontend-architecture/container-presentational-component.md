---
title: Container and presentational components
description: Separating data and behavior concerns from display-focused components.
tags:
  - frontend-architecture
  - react
---

**Container and presentational components** split UI code by responsibility.

Container components handle data loading, state, permissions, and actions.

Presentational components focus on rendering props and user interactions close to the UI.

This pattern can clarify [[component-boundary|component boundaries]], but it should not be forced when a simpler colocated component is easier to understand.
