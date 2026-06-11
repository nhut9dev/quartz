---
title: MVC and MVVM
description: UI architecture patterns that separate state, presentation, and interaction logic.
tags:
  - design-patterns
  - frontend
---

**MVC** separates model, view, and controller responsibilities.

**MVVM** separates model, view, and view model, where the view model shapes state and commands for the UI.

Modern frontend frameworks do not always use these labels directly, but the same concern remains: keep domain state, [[state-location|view state]], and rendering responsibilities understandable.
