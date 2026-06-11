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
