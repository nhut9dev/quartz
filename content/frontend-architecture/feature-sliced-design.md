---
title: Feature-Sliced Design
description: A frontend architecture approach that organizes code by product features and layers.
tags:
  - frontend-architecture
---

**Feature-Sliced Design** is a way to organize frontend applications around product features and architectural layers.

Common layers include app setup, pages, widgets, features, entities, and shared code.

The goal is to make dependencies flow in one direction and keep feature code close to the behavior it supports, with each layer acting as a clear [[component-boundary|boundary]].

It is most useful when a frontend app has many routes, teams, or product areas. For small apps, a simpler feature-based [[folder-structure|folder structure]] is often enough.

## How it works

Layers are ordered by abstraction level (commonly `app` → `pages` → `widgets` → `features` → `entities` → `shared`), and the core rule is **a module can only import from layers below it, never above or sideways** — a `feature` can use `entities` and `shared`, but `entities` can't import from `features`, and one `feature` slice can't directly import another `feature` slice. This rule is typically enforced by a lint plugin (e.g. Steiger), not just convention, since nothing in the language itself prevents a sideways import.

## When to use

The layering pays off once an app has enough features/routes/teams that uncontrolled cross-imports start producing a tangled dependency graph — where deleting or changing one feature risks breaking others that quietly imported from it. For a small app with a handful of routes, deciding "which layer does this belong in" for every new file is overhead with no corresponding payoff.

## Trade-offs

Enforced unidirectional dependencies make large-scale changes safer — a feature slice can be deleted or rewritten without auditing whether other features secretly depend on its internals, because the import rule guarantees they can't. The cost is the upfront cognitive overhead of layer placement: some code doesn't map cleanly onto "entity vs. feature vs. widget," and teams spend time on classification debates that wouldn't exist with a flatter structure.

## Pitfalls

The rule only holds if it's enforced — under deadline pressure, a `shared` component reaching into `features` "just this once" to save time is the most common violation, and once one exists, the dependency graph the architecture was meant to guarantee is no longer true, silently. The other failure mode is over-applying the structure to small apps or early-stage products where the feature boundaries themselves are still unstable — restructuring layers every time the product direction changes costs more than a simpler [[folder-structure|folder structure]] would have.
