---
title: Cascade layer
description: A CSS feature that controls cascade order by named layers.
tags:
  - css
---

**Cascade layers** let CSS authors define high-level priority groups.

```css
@layer reset, base, components, utilities;
```

Layers help manage resets, design system styles, component styles, and utility classes without relying only on selector specificity.

## How it works

`@layer` slots into the [[cascade|cascade]] between importance and [[specificity|specificity]]: a rule in an earlier layer loses to a rule in a later layer **no matter how specific** the earlier rule's selector is. The *order* of layers is fixed by the first place they're named — the bare statement `@layer reset, base, components, utilities;` at the top of a stylesheet fixes that order for everything that follows, even though each layer's actual rules are written later (and possibly in separate files). Styles written **outside any layer** ("unlayered") behave as if they're in one final, highest-priority layer — they beat every layered rule regardless of specificity.

## When to use

Layers are the tool for the recurring "I need to override a library's styles but its selector is too specific" problem. A typical setup gives resets/normalize their own layer, then design-system/component styles, then utilities last — Tailwind v4 generates exactly this shape (`theme`, `base`, `components`, `utilities`) so a single-class utility can still beat a component's multi-class selector simply by being in a later layer.

## Trade-offs

Layers make override order **explicit and independent of specificity and source order**, which removes the need for selector arms races (`.btn` → `.card .btn` → `.card .btn.primary`). The cost is a second ordering system layered on top of the cascade you already have to reason about — and because layer order is set by *first mention*, splitting layer declarations across files/imports can make that order hard to see at a glance.

## Pitfalls

Third-party CSS you don't control (a CDN stylesheet, an embedded widget) is unlayered by default and will **always** beat your layered styles, regardless of how you order your own layers — if you need to control it, wrap the import itself in a layer with `@import url(...) layer(vendor)`. Forgetting the upfront `@layer name, name, ...;` order declaration means layer order falls back to the order layers are first *encountered*, which can silently differ between a dev build and a production build if files are concatenated differently.
