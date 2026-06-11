---
title: Accessibility strategy
description: Treating accessibility as a product and engineering constraint across design, implementation, and testing.
tags:
  - frontend-architecture
  - accessibility
  - product-engineering
---

An **accessibility strategy** defines how a frontend team prevents, detects, and fixes barriers for keyboard, screen reader, low vision, motion-sensitive, and other users.

Accessibility is not only a final audit. It affects component choices, interaction design, routing, focus behavior, error messages, color tokens, and test coverage.

## Baseline

Use semantic HTML first, then ARIA only when native elements cannot express the interaction. Components such as dialogs, menus, comboboxes, and toasts need explicit focus and announcement behavior.

Design tokens should include contrast-safe color pairs, visible focus states, reduced-motion behavior, and enough spacing for touch targets.

## Quality gates

Automated checks catch missing names, invalid ARIA, and some contrast issues, but they do not prove a flow is usable. Critical workflows still need keyboard testing and screen reader spot checks.

Accessibility bugs should be treated like product bugs when they block a user from completing a task.

Related notes: [[../accessibility/semantic-html|Semantic HTML]], [[../accessibility/keyboard-navigation|Keyboard navigation]], [[../accessibility/focus-management|Focus management]], [[../accessibility/accessible-name|Accessible name]], and [[../accessibility/wcag|WCAG]].
