---
title: Angular
description: A full-featured framework with built-in DI, routing, forms, and change detection.
tags:
  - frameworks
  - angular
---

**Angular** is a full-featured framework — routing, forms, an HTTP client, dependency injection, and a CLI are built in, in contrast to React's "bring your own libraries" approach.

## How it works

Angular components are classes with decorators (`@Component`) that declare a template, and the framework uses **dependency injection** to provide services — HTTP clients, shared state, auth — to components via constructor parameters. Angular's injector resolves what to construct and pass in, rather than components importing dependencies directly. Change detection (historically Zone.js-based, monkey-patching async APIs so the framework knows when something might have changed; newer versions add fine-grained signals) determines when to re-check and re-render the component tree.

## When to use

Angular fits larger teams and enterprise codebases where one prescribed way to do routing, forms, HTTP, and DI reduces architectural debates and onboarding cost — the framework's opinions cover most of what a team would otherwise assemble from separate libraries in a React app.

## Trade-offs

The built-in DI system makes it straightforward to swap in mock services for testing, in place of real ones, without restructuring components — but DI, decorators, and Zone.js-based change detection add conceptual surface area beyond plain JavaScript/TypeScript that a hooks-based React mental model doesn't need.

## Pitfalls

Zone.js-based change detection patches global async APIs (`setTimeout`, `Promise`, event listeners) so Angular knows when something might have changed — code that runs outside Angular's zone, like a third-party library's callback, won't trigger change detection, leaving the UI stale until something else triggers a check. Angular's newer Signals API is a partial move toward the fine-grained reactivity model used by [[vue|Vue]] or [[solidjs|Solid]]'s [[signals|signals]], and mixing signal-based and Zone-based change detection in the same app during migration can produce components that update via two different mechanisms.
