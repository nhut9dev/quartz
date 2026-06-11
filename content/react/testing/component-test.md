---
title: Component test
description: A test that renders a UI component and checks its behavior.
tags:
  - react
  - testing
---

A **component test** renders a UI component and checks what it shows or how it responds to interaction.

Component tests sit between small [[../../jest/unit-test|unit tests]] and full [[../../playwright/e2e-test|end-to-end tests]]. They are useful for forms, conditional rendering, loading states, validation, and component integration.

Good component tests avoid checking private state. They interact with the rendered UI and assert visible behavior.
