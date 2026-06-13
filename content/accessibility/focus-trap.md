---
title: Focus trap
description: A focus behavior that keeps keyboard navigation inside an active modal or popover.
tags:
  - accessibility
---

A **focus trap** keeps [[keyboard-navigation|keyboard focus]] inside a modal dialog or blocking surface while it is open.

Without a focus trap, keyboard users can tab into content hidden behind the modal.

A good modal also handles [[focus-management|moving focus]] into the dialog when opened and restoring it to the trigger when closed.

Use focus traps only for truly modal UI. Non-modal panels should not trap focus.

## How it works

A focus trap listens for the `Tab` and `Shift+Tab` keys and intercepts them at the boundaries of the modal: pressing `Tab` on the last focusable element moves focus back to the first, and `Shift+Tab` on the first moves it to the last, instead of letting focus escape into the page behind. The native `<dialog>` element with `.showModal()` does most of this for free — it also blocks interaction with the rest of the page and closes on `Escape`. The newer `inert` attribute is an alternative approach: applying `inert` to everything *except* the modal removes it from both the tab order and the accessibility tree in one step, without manually tracking boundary elements.

## When to use

Trap focus for content that blocks interaction with the rest of the page until dismissed: confirmation dialogs, login modals, image lightboxes with a dimmed backdrop. Don't trap focus for non-modal UI that happens to float above other content — comboboxes, toasts, popovers, and tooltips should let Tab continue past them, since the user can still interact with the rest of the page.

## Trade-offs

`<dialog>`/`.showModal()` or `inert` gives correct trapping behavior with almost no custom code, at the cost of less control over exact styling and backdrop behavior in older browsers. A hand-rolled trap (tracking first/last focusable element, intercepting `Tab`) gives full control but has to be re-derived whenever the modal's content changes — a focusable element added or removed dynamically (an error message, a loading spinner) shifts what "first" and "last" mean, and a trap that doesn't recompute on every render lets focus escape or get stuck.

## Pitfalls

A trap with no focusable elements inside it (an empty or still-loading dialog) has nothing to cycle between — `Tab` does nothing, and the user appears stuck with no visible way out unless `Escape` is also wired up. Forgetting to restore focus to the trigger element on close is the other common miss — without it, focus falls back to `<body>` and keyboard users lose their place in the page entirely. Finally, a trap built by querying focusable elements once on mount goes stale if the modal's content changes afterward (a form that conditionally reveals more fields) — the trap's "first/last" boundaries no longer match what's actually focusable.
