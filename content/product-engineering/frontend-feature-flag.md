---
title: Frontend feature flag
description: A runtime switch that changes frontend behavior without a new deployment.
tags:
  - product-engineering
  - frontend
  - deployment
---

A **frontend feature flag** changes UI behavior at runtime without shipping a new frontend build.

Flags are used for staged rollouts, experiments, permission-based features, kill switches, and separating deploy from release.

Frontend flags are visible to users, so they should not be treated as a security boundary. Sensitive authorization still belongs on the server.

Feature flags connect product rollout with [[../deployment/feature-flag|deployment feature flags]] and [[analytics-event-tracking|analytics event tracking]].

## How it works

At runtime, the app evaluates each flag against the current context — user ID, account plan, region, or a random bucket for percentage rollouts — to get a boolean or variant value. Evaluation can happen via a config blob bundled at build time, or via a client SDK that fetches targeting rules and evaluates them locally; the choice determines how fast a flag change propagates — a build-time constant needs a redeploy, while a fetched config can change without one.

## When to use

Flags decouple deploying code from releasing a feature: ship the code dark, then enable it for an internal team, a percentage of users, or everyone, without a new build. They're also the standard mechanism for kill switches — instantly disabling a misbehaving feature — and for running A/B experiments where the variant is decided per user.

## Trade-offs

Each flag adds a permanent branch to the codebase until removed, and every combination of flags is technically a different build to test — in practice teams test only the "current" combination, and the rest atrophy. The more flags accumulate without cleanup, the more this combinatorial surface grows, and old flags quietly become load-bearing infrastructure nobody remembers is conditional.

## Pitfalls

Because the flag value — and often the targeting rules around it — ship to the client, a curious user can inspect the bundle or network response and see flags for features not yet enabled for them; frontend flags gate UI, not access, so any sensitive logic behind a flag still needs a server-side check. A second failure mode is a flag value that gets cached — in a service worker, a static export, or a long-lived session — so flipping it server-side doesn't change what already-loaded clients see until they refresh or the cache expires, making "instant" kill switches not actually instant.
