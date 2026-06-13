---
title: Storybook
description: A tool for developing and showcasing UI components in isolation.
tags:
  - tooling
  - frontend
---

**Storybook** is a tool for developing and showcasing UI components in isolation, outside the app they belong to.

## How it works

Each component gets one or more **stories** — a function that renders the component with a specific set of props or state — in a `.stories.tsx` file. Storybook's dev server renders each story on its own, outside the app's routing and providers, with an addon panel for live prop editing (controls), accessibility checks, and viewport sizing.

## When to use

Use Storybook for shared or design-system components used across multiple apps or teams, where developing and reviewing a component in isolation — without navigating the full app to reach the state that renders it — speeds up iteration. For one-off, page-specific components with no reuse, the overhead of writing and maintaining stories may not pay off.

## Trade-offs

Storybook gives designers and other engineers a way to browse and interact with components without running the full app, and pairs with tools like Chromatic for visual regression testing — but every story is another artifact that needs updating when the component's props or behavior change. Stories that fall out of sync with the real component give a false sense of what it looks like.

## Pitfalls

Components that rely on context providers, routing, or global state need that context recreated in Storybook via decorators — a component that "works in Storybook" but throws in the app (or vice versa) usually means the story's mocked context doesn't match what the app actually provides. Visual regression tests against Storybook snapshots get noisy if stories render non-deterministic content — dates, random IDs — without fixing them for the test.
