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

## How it works

When a hook is tested through a component that uses it, the test interacts with the component the way a user would — typing, clicking — and asserts on what renders, exercising the hook exactly as it's used in production. A dedicated test harness — a minimal component that only renders the hook's output — isolates the hook from any specific consumer, useful when the hook is shared across many components with different UIs.

## When to use

Test through a real (or minimal) consuming component by default — it verifies the hook's actual contract with React, including effects, re-renders, and cleanup, under real rendering conditions. Reach for an isolated harness when a hook has complex internal state transitions that would need an elaborate UI just to exercise, or when it's a shared library hook used by many unrelated components.

## Trade-offs

Testing through a component is more realistic — it catches issues like the hook causing extra re-renders or effects firing at the wrong time, which only show up in a real render tree — but it's slower to write if the component has unrelated setup requirements (providers, routing) that have nothing to do with the hook itself.

## Pitfalls

Asserting on a hook's internal state directly — reaching into its return value and checking an implementation-detail field — couples the test to the hook's current shape rather than its observable behavior, so it breaks on refactors even when consumers see no difference. A hook test that doesn't trigger re-renders the way React actually would — skipping `act()`, not awaiting state updates — can pass while missing real timing bugs that only appear under React's actual scheduling, see [[../strict-mode|Strict Mode]].
