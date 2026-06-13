---
title: ARIA
description: Attributes that expose roles, states, and properties to assistive technologies.
tags:
  - accessibility
  - html
---

**ARIA** (Accessible Rich Internet Applications) is a set of attributes for describing roles, states, and properties to [[screen-reader|assistive technologies]].

```html
<button aria-expanded="false" aria-controls="menu">
  Menu
</button>
```

ARIA can improve custom widgets, but it does not add behavior by itself. If a `div` is given `role="button"`, [[keyboard-navigation|keyboard handling]] still has to be implemented manually.

Prefer [[semantic-html|semantic HTML]] whenever it already provides the role and behavior you need.

## How it works

ARIA attributes fall into three categories. **Roles** (`role="dialog"`, `role="tablist"`) tell assistive technology what a generic element *is*, overriding its default semantics — applying one of these is making a promise that the element will behave like the real thing. **States** are dynamic and expected to change at runtime (`aria-expanded`, `aria-checked`, `aria-selected`, `aria-disabled`) — the browser exposes these in the accessibility tree and screen readers announce changes. **Properties** are mostly static descriptors (`aria-label`, `aria-describedby`, `aria-required`). None of these three categories touch focus, keyboard handling, or click behavior — the accessibility tree is purely declarative information layered on top of whatever JavaScript behavior you write separately.

## When to use

ARIA exists for the gap semantic HTML can't fill: custom widgets with no native equivalent (comboboxes, tree views, tab panels, sortable tables), or relationships between elements that markup alone can't express (`aria-describedby` linking an input to its error message). It is not a substitute for `<button>`, `<nav>`, `<input>` — the "first rule of ARIA" is don't use ARIA if a native element already provides the role, state, and behavior you need.

## Trade-offs

ARIA gives you the *vocabulary* of accessible widgets without the *implementation* — a `role="slider"` announces correctly to a screen reader but arrow-key handling, value clamping, and focus management are entirely your code's responsibility. This buys flexibility (you can describe any custom UI) at the cost of needing to manually replicate everything a native element gives for free, and getting any piece wrong produces a worse experience than no ARIA at all — a screen reader user is told "slider" but finds it doesn't respond to arrow keys.

## Pitfalls

A `role` overrides the element's native semantics entirely, so `<button role="link">` is announced as a link, not a button — applying roles to elements that already have the right native role is redundant at best and contradictory at worst. State attributes like `aria-expanded` or `aria-checked` must be kept in sync with the actual UI state on every update; a stale `aria-expanded="false"` on an open menu actively misinforms assistive technology, which is worse than omitting it. And `aria-hidden="true"` on a container hides it (and everything inside, including focusable elements) from the accessibility tree but does **not** remove it from the [[keyboard-navigation|tab order]] — a hidden panel can still receive keyboard focus unless its children also get `tabindex="-1"` or the container uses `inert`.
