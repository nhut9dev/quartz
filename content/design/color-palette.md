---
title: Color palette
description: A selected set of colors used consistently across a design.
tags:
  - design
  - color
---

**Color palette** is a selected set of colors used consistently across a design.

A practical interface palette usually has neutrals, text colors, surfaces, borders, one or two brand colors, and semantic colors for success, warning, danger, and information. It should connect to [[color-theory|color theory]] and pass [[../accessibility/color-contrast|color contrast]] checks.

Good palettes include roles, not only swatches. `primary-600`, `danger-bg`, and `text-muted` are easier to use consistently than unnamed hex values scattered through components.

When a palette moves into code, represent stable decisions as [[../css/design-token|design tokens]] so color usage can evolve without rewriting every component.
