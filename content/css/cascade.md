---
title: Cascade
description: The CSS algorithm that decides which declarations win when several rules target the same element.
tags:
  - css
---

The **cascade** is the browser algorithm that decides which CSS declaration applies when multiple declarations target the same element and property.

```css
.button { color: black }
.primary { color: white }
```

## The order of decisions

The cascade resolves conflicts in stages, each only consulted when the previous one ties. First **origin and importance**: user-agent styles lose to author styles, which lose to author `!important`, which lose to user `!important`. Then **cascade layers**. Then [[specificity|specificity]]. Finally **source order** — the last matching rule wins. So above, both selectors are one class each; the tie breaks on source order and `.primary` wins.

## What you meet day to day

For most code only the bottom two stages matter: specificity decides, and equal specificity falls to whichever rule comes later. Reaching for the higher stages — `!important`, or stacking specificity with extra selectors — is usually a sign the design has drifted.

## Pitfalls

`!important` short-circuits specificity and triggers escalation wars where the only way to override is another `!important`. Inline `style` attributes outrank selector rules. [[cascade-layer|Cascade layers]] reorder everything beneath importance, so a low-specificity rule in a later layer can beat a high-specificity one in an earlier layer — powerful, but surprising if you forget the layer order.
