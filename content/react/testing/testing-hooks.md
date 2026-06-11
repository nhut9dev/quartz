---
title: Testing hooks
description: Testing custom React hooks through their observable behavior.
tags:
  - react
  - testing
  - hook
---

**Testing hooks** means verifying a custom [[../custom-hook|hook]] behaves correctly when inputs, state, context, or async data change.

Simple hooks can often be tested through a component that uses them. More isolated hook tests can render the hook with a dedicated test helper.

The goal is the same as component testing: assert observable behavior, not private implementation details.
