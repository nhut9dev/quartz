---
title: Strangler fig
description: Incrementally replacing a legacy system by routing slices of functionality to new services.
tags:
  - architecture
  - migration
---

The **strangler fig** pattern replaces a legacy system gradually: a facade routes individual slices of functionality to new services while the old system keeps handling the rest, until the legacy code is fully "strangled" and removed.

## How it works

A facade — often an [[api-gateway|API gateway]] or reverse proxy — sits in front of the legacy system and intercepts all traffic. Initially it forwards everything to the old code. As each capability is rebuilt, its routes are switched to the new service, one slice at a time. An [[anti-corruption-layer|Anti-corruption layer]] lets the new and old systems coexist without the legacy model bleeding into the new design.

The name comes from the strangler fig vine, which grows around a host tree until the original eventually dies away.

## When to use

Prefer this over a big-bang rewrite when the legacy system is too large or risky to replace all at once. It keeps the system shippable throughout, lets you validate each migrated slice in production, and allows rollback by simply re-pointing a route. It pairs naturally with decomposing a monolith — see [[monolith-vs-microservices|Monolith vs microservices]].

## Tradeoffs

You run two systems in parallel for a long stretch, with a facade and routing rules to maintain and duplicated paths to keep in sync. Migrations can stall halfway, leaving permanent complexity. The payoff is reduced risk and continuous delivery versus the all-or-nothing gamble of a rewrite.
