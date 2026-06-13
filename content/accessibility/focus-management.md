---
title: Focus management
description: Controlling keyboard focus so interactive UI stays predictable.
tags:
  - accessibility
  - interaction
---

**Focus management** controls where keyboard focus moves when the UI changes. It matters for dialogs, menus, route changes, [[html-form-validation|validation errors]], and dynamically inserted content.

When a modal opens, focus should move into it and stay there with a [[focus-trap]]. When it closes, focus should usually return to the control that opened it.

Bad focus management can leave keyboard users stuck, lost, or interacting with content hidden behind an overlay. Good focus management makes [[keyboard-navigation|keyboard navigation]] predictable.

```js
const previouslyFocused = document.activeElement;
dialog.showModal();
dialog.querySelector("h2").focus(); // move focus into the dialog

// on close
dialog.close();
previouslyFocused.focus(); // restore focus to the trigger
```

## How it works

Focus order normally follows DOM order, but `tabindex` can change it: `tabindex="0"` makes a non-interactive element (a `div`, an `h2`) focusable in its natural DOM position, `tabindex="-1"` makes it focusable only *programmatically* via `.focus()` — not via Tab — which is exactly what's needed to move focus into a newly revealed dialog or panel without adding an extra tab stop. Positive `tabindex` values (`1`, `2`, ...) reorder the tab sequence ahead of everything else, which is almost always a mistake since it's nearly impossible to keep in sync with visual layout. `:focus-visible` lets you style the focus ring only for keyboard/programmatic focus, not mouse clicks, without the older `:focus` vs `outline: none` tradeoff.

## When to use

Manage focus explicitly whenever the UI changes in a way the user didn't directly click into: opening a dialog/drawer/menu (focus moves in, then [[focus-trap|trap]] keeps it there), closing one (focus returns to the trigger), client-side route changes in an SPA (focus should move to the new page's heading or main content, since there's no full page load to reset it), and async content that appears without a click (focus a [[aria-live|live region]] or the new content, depending on urgency).

## Trade-offs

Programmatic focus management makes dynamic UI usable for keyboard and screen reader users — without it, a route change in an SPA leaves focus on a now-stale or removed element, and the user has no indication anything happened. The cost is that it must be done by hand for every dynamic transition; frameworks don't manage this automatically the way a full page navigation does, so it's an easy thing to omit and an easy thing to get subtly wrong (moving focus to the wrong element, or moving it when nothing actually changed).

## Pitfalls

A common bug: when a focused element is removed from the DOM (closing a menu, conditionally unmounting in React), focus silently falls back to `<body>` — the next Tab press starts from the top of the page instead of where the user was. Always move focus explicitly *before* removing the element. Another is `outline: none` applied globally to "fix" focus ring styling — this removes the visual indicator for keyboard users entirely; use `:focus-visible` to restyle instead of removing. And `tabindex="-1"` elements don't appear in the Tab sequence but **do** remain focusable via `.focus()` and via click — this is the desired behavior for dialog containers, but surprises people who expect `tabindex="-1"` to fully disable an element (use `disabled` or `inert` for that).
