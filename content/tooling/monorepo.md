---
title: Monorepo
description: A repository that contains multiple projects or packages together.
tags:
  - tooling
---

A **monorepo** stores multiple packages, apps, or services in one repository.

It can simplify shared code, atomic changes, and consistent tooling.

It also requires attention to dependency boundaries, build [[caching]], ownership, and CI performance.

## How it works

Packages reference each other through the package manager's workspace protocol (e.g. `"workspace:*"`), which links local packages into `node_modules` instead of fetching them from a registry — so a change to one package is immediately visible to others that depend on it, without publishing. A single lockfile typically covers every package's dependencies.

## When to use

Use a monorepo when packages genuinely share code that changes together — a design system consumed by multiple apps, a shared types package between frontend and backend, an API client generated from a shared schema. If packages don't share code and release independently with no coordination needed, separate repos avoid the shared-tooling overhead entirely.

## Trade-offs

Atomic cross-package changes — update a shared library and all its consumers in one commit — come at the cost of CI that has to deal with the whole repo: without task-level caching, a one-line change to a leaf package can trigger a full rebuild and test run of everything that depends on it. See [[turborepo|Turborepo]] for how caching addresses this.

## Pitfalls

Packages often depend on each other's *built* output, not source — editing package A without rebuilding it leaves package B working against stale compiled code, a confusing class of "my change isn't showing up" bug. Circular dependencies between packages (A imports from B, B imports from A) are easy to introduce by accident and can break builds or cause import-order bugs that only surface at specific entry points. And a single shared lockfile means one package's dependency upgrade can change resolved versions for every other package in the repo, even ones that didn't ask for it.
