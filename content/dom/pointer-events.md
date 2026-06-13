---
title: Pointer events
description: A unified event model for mouse, touch, and pen input.
tags:
  - dom
  - mobile
---

**Pointer Events** (`pointerdown`, `pointermove`, `pointerup`, `pointercancel`, etc.) unify mouse, touch, and pen input into a single event model — one set of handlers works across input types instead of separately handling mouse and touch events.

## How it works

Each pointer event carries a `pointerId` (to distinguish multiple simultaneous touches), a `pointerType` (`"mouse"`, `"touch"`, `"pen"`), and pressure/tilt data for stylus input. `setPointerCapture(pointerId)` redirects all subsequent events with that ID to a specific element regardless of where the pointer physically moves — the basis for drag interactions that keep working even when the pointer moves outside the element's bounds.

## When to use

Use pointer events as the default for custom interactive elements — sliders, drag handles, drawing surfaces — that need to work across mouse, touch, and pen without separate code paths. Fall back to [[touch-events|touch events]] specifically when an interaction needs to track multiple simultaneous contacts as a coordinated gesture, like pinch-to-zoom — pointer events fire one event per pointer rather than grouping them.

## Trade-offs

A single pointer-events implementation replaces separate mouse-event and touch-event handling, removing the duplicate "did this already fire as a mouse event after the touch event" problem browsers historically had for compatibility — but pointer events alone don't give the multi-touch group semantics (`event.touches` listing all active contacts at once) that gesture libraries built on raw touch events rely on.

## Pitfalls

Forgetting `touch-action: none` (or an appropriate value) in CSS on an element handling pointer-based drag or draw means the browser's default touch behaviors — scrolling, pinch-zoom — compete with the pointer handlers, causing janky or cancelled gestures (`pointercancel` fires when the browser takes over for its own gesture). A pointer capture left active after the interaction ends — forgetting `releasePointerCapture`, though `pointerup` releases it automatically in most cases — can cause a different element to stop receiving pointer events unexpectedly.
