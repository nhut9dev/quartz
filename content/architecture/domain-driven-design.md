---
title: Domain-driven design
description: Modeling software around business concepts and language.
tags:
  - architecture
---

**Domain-driven design** (DDD) models software around the business domain and its language, rather than starting from database tables or technical layers.

## Core ideas

DDD splits into two halves. The **strategic** side is about boundaries: a large domain is divided into **bounded contexts**, each with its own model, where a term like "order" can mean something different and that's fine — contexts integrate through explicit contracts ([[anti-corruption-layer|anti-corruption layers]]) rather than one sprawling shared model. The **tactical** side is about building blocks inside a context: entities (identity over time), value objects (defined by their attributes), aggregates (consistency boundaries with a single root), and domain services.

Tying both together is the **ubiquitous language** — a vocabulary shared by developers and domain experts, used identically in conversation and in code. When an expert says "a policy lapses," there's a `Policy.lapse()` in the code, not a `status = 3` update buried in a service. The language *is* the model.

## When to use

DDD earns its cost when business rules are complex and the price of misunderstanding them is high — insurance, finance, logistics, healthcare. There, the modeling effort and shared language prevent expensive misencoded rules. It leads to clearer [[../web/backend/service-layer|service boundaries]], stronger module ownership, and fewer generic data models that hide important behavior behind anemic CRUD.

## Pitfalls

For a simple or mostly-CRUD domain, DDD is overkill — the tactical patterns become ceremony around what is really just data entry. The most common failure is **cargo-culting the tactical patterns** (entities, repositories, aggregates) while skipping the strategic work that gives them meaning: without genuine collaboration with domain experts and a real ubiquitous language, you get the boilerplate of DDD with none of the clarity. Getting bounded-context boundaries wrong is also costly to undo, since they tend to harden into team and service boundaries.
