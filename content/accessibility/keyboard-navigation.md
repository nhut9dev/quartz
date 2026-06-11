---
title: Keyboard navigation
description: Letting users operate an interface without a mouse.
tags:
  - accessibility
  - interaction
---

**Keyboard navigation** means users can reach and operate controls with the keyboard. This is essential for many [[screen-reader|assistive technology]] users and useful for power users.

Native controls like `<button>`, `<a>`, `<input>`, and `<select>` already support keyboard behavior. Custom widgets must implement [[focus-management|focus]], activation keys, and expected arrow-key behavior themselves.

The most common baseline is simple: tab order should be logical, focus should be visible, and every mouse action should have a keyboard path.
