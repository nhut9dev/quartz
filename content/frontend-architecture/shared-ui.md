---
title: Shared UI
description: Reusable interface components shared across features.
tags:
  - frontend-architecture
---

**Shared UI** is the set of reusable components used across multiple features.

Examples include buttons, inputs, dialogs, menus, tables, empty states, and layout primitives.

Shared UI should stay mostly domain-neutral so it does not become a hidden dependency between unrelated features.

It usually belongs near the [[design-system|design system]] layer, while feature-specific UI stays closer to the feature that owns it.
