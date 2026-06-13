---
title: Clean architecture
description: Separating business rules from frameworks, databases, and delivery mechanisms.
tags:
  - architecture
---

**Clean architecture** organizes code so that core business rules don't depend on external details like frameworks, databases, or HTTP — the details depend on the core, never the other way around.

## The dependency rule

The whole idea reduces to one constraint: **dependencies point inward**. Picture concentric layers — entities and use cases (the domain) at the center, adapters (controllers, presenters, repositories) around them, and frameworks/drivers (web server, [[../database/orm|ORM]], message broker) on the outside. Source-code dependencies may only point *toward* the center. Inner layers know nothing about outer ones.

This is enforced with **interfaces owned by the inside**. A use case needs to save data, so it declares a `Repository` interface in the domain layer; the database adapter in the outer layer *implements* it. At runtime the outer code is injected in, but at compile time the domain depends only on its own interface — so the database, the web framework, and the delivery mechanism become swappable plugins around a core that doesn't know they exist.

## When to use

It pays off when the domain logic is the valuable, long-lived part and the surrounding tech is expected to change — long-lived products, complex business rules, systems that may swap frameworks or data stores. The payoff is testability (the core runs with no database or HTTP) and isolation of what matters from what's incidental.

## Trade-offs

The cost is ceremony: more interfaces, indirection, and mapping between layers (domain objects ↔ DB rows ↔ DTOs), which is pure overhead for a simple CRUD app where the framework *is* essentially the application. Applied dogmatically it produces layers of boilerplate that obscure rather than clarify. Match the number of boundaries to how much the domain actually justifies them — it pairs naturally with [[domain-driven-design|domain-driven design]] when the domain is genuinely rich.
