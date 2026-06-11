---
title: Component API design
description: Designing component props, slots, and variants so UI primitives stay reusable without becoming vague.
tags:
  - frontend-architecture
  - react
  - design-system
---

**Component API design** is the work of deciding how other developers use a component: which props exist, which combinations are valid, how composition works, and what the component owns internally.

A good component API makes the common case simple, keeps invalid states hard to express, and leaves room for product-specific composition without turning the component into a giant configuration object.

## Good signals

Prefer named variants when the design system has a finite set of approved appearances. Prefer composition when the caller needs to control structure, content, or nested behavior.

Boolean props are fine for one independent toggle, but several booleans often create unclear combinations. A `variant`, `size`, or discriminated prop shape is usually easier to reason about.

## Ownership

Be explicit about what the component owns. A text input may own focus styling and ARIA wiring, while the caller owns field value, validation message, and submit behavior. A dialog may own focus trapping and escape handling, while the caller owns whether it is open.

## Pitfalls

Avoid passing through every possible HTML or library prop if the component is meant to protect a design decision. Also avoid hiding important behavior behind magic defaults; if the caller must understand it to use the component safely, make it visible in the API.

Related notes: [[design-system|Design system]], [[shared-ui|Shared UI]], [[../react/component-composition|Component composition]], and [[../react/compound-component|Compound component]].
