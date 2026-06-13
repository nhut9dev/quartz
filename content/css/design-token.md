---
title: Design token
description: A named design decision such as color, spacing, typography, or radius.
tags:
  - css
  - design
---

A **design token** is a named value for a reusable design decision.

Examples include color, spacing, typography, border radius, shadow, and motion duration.

Tokens help keep design and code aligned by giving shared names to values that appear across many components.

## How it works

Tokens usually form a chain of layers. **Primitive** (or global) tokens are raw values — `blue-500: #2563eb`, `space-4: 16px` — with no meaning attached. **Semantic** (or alias) tokens point to primitives but name a *purpose* — `color-brand: {blue-500}`, `color-danger: {red-600}`. **Component** tokens point to semantic tokens for a specific use — `button-bg: {color-brand}`. Code and design tools consume the same names; in CSS, tokens are commonly emitted as [[css-variable|CSS variables]] (and in Tailwind, as `@theme` entries), so swapping a theme is just swapping which values the variables resolve to.

## When to use

Tokens earn their keep once a value needs to be **consistent and swappable** across many components — multiple themes (light/dark, brand variants), a design system shared with a design tool, or a product with enough surface area that "just hardcode it" causes drift. For a small project or a one-off page, a flat [[../design/design-scale|scale]] of values may be all you need without a full token pipeline.

## Trade-offs

The semantic layer is what makes theming and rebranding cheap: redefine `color-brand` once and every component using it updates, without touching component code. The cost is indirection — to find out what a component actually renders, you follow `button-bg → color-brand → blue-500`, and that chain needs tooling (Style Dictionary, Tokens Studio, or a `@theme` block) to stay in sync between design and code rather than drifting into two sources of truth.

## Pitfalls

Creating a component-level token for every one-off value recreates the inconsistency tokens were supposed to fix — if `button-bg` and `card-header-bg` both just alias `color-brand`, the extra layer adds no value and only adds names to remember. Naming a token after its *current value* instead of its *purpose* (`blue-button-bg` instead of `button-primary-bg`) breaks the moment the brand color changes. And removing or renaming a widely-referenced token is effectively a breaking change — treat the semantic layer as a contract, not an implementation detail.
