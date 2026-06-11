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
