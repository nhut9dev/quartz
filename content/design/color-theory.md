---
title: Color theory
description: A way to reason about hue, value, saturation, and relationships between colors.
tags:
  - design
  - color
---

**Color theory** is a way to reason about how hue, value, saturation, and color relationships affect meaning, readability, and visual balance.

### How it works

Hue is the color family, value is how light or dark it is, and saturation is how intense it feels. UI color usually depends more on value and saturation than on hue alone: two blues can feel calm, loud, disabled, or premium depending on contrast and intensity.

Color relationships create structure. Complementary colors create tension, analogous colors feel more unified, and neutral colors give content room to breathe. In interface work, color should support [[visual-hierarchy|visual hierarchy]], state, brand, and [[../accessibility/color-contrast|color contrast]] instead of acting as decoration.

### When to use

Use color deliberately when a user needs to notice status, priority, grouping, selection, danger, or affordance. A muted base with a small number of semantic accents is usually easier to maintain than a palette where every section invents a new color.

### Trade-offs

Strong color improves recognition and emotional tone, but it can also compete with content, fail accessibility checks, or make states ambiguous. Color systems need enough range for hover, active, disabled, surface, border, and text states, not just a few attractive swatches.

### Pitfalls

Do not rely on color alone to convey meaning. Pair it with labels, icons, borders, position, or shape so the message survives color blindness, low contrast screens, and grayscale contexts.
