---
title: Anti-corruption layer
description: A translation layer that isolates your domain model from an external system's model.
tags:
  - architecture
  - domain-driven-design
---

An **anti-corruption layer (ACL)** is a translation boundary that maps between your domain model and a legacy or external system's model, so the foreign system's concepts and quirks don't leak into your own.

## How it works

The ACL sits at the boundary as an adapter. Inbound, it converts the external system's data and vocabulary into your domain's terms; outbound, it translates your model back into whatever the external system expects. Your core code only ever speaks its own language and never imports the legacy schema, naming, or assumptions.

It's a [[domain-driven-design|Domain-driven design]] tactic for protecting a clean bounded context from a messy neighbor you don't control or want to mimic.

## When to use

Apply an ACL whenever you integrate with a system whose model conflicts with yours — a legacy database, a third-party API, or another team's service with different semantics. It is also the connective tissue during a [[strangler-fig|Strangler fig]] migration, letting new services talk to the old system without inheriting its design.

## Tradeoffs

The layer is extra code to write and maintain, and the translation can hide subtle mismatches if it's incomplete. The cost is justified when the external model is unstable, poorly designed, or fundamentally different from yours — protecting the core is worth the seam.
