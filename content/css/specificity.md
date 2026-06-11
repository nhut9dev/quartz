---
title: Specificity
description: The weight CSS uses to compare selectors in the cascade.
tags:
  - css
---

**Specificity** is the weight CSS gives to a selector. When two declarations target the same property, the selector with higher specificity usually wins.

```css
button     { color: black }
.button    { color: blue }
#save-button { color: green }
```

## How it's calculated

Specificity is three buckets compared left to right: **ids**, then **classes / attributes / pseudo-classes**, then **elements / pseudo-elements**. A single id (`1,0,0`) beats any number of classes (`0,9,0`) because the higher bucket is compared first. Inline `style` ranks above all selectors, and `!important` sits in its own tier above that. Modern selectors help here: `:where()` always contributes **zero** specificity, while `:is()` and `:not()` take the specificity of their most specific argument.

## Keeping it low

Flat, single-class selectors (the idea behind [[bem|BEM]]) stay easy to override and reuse. Every id or descendant combinator you add raises the bar that future rules must clear.

## Pitfalls

High-specificity selectors force ever-higher ones to override them, ending in `!important`. Id selectors are the usual trap — convenient to target, painful to restyle. Long descendant chains (`.nav ul li a`) quietly inflate specificity, and `:not(...)` raises it in ways people don't expect. Specificity is only one stage of the [[cascade|cascade]]; equal specificity still falls to source order.
