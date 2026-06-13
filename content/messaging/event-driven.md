---
title: Event-driven architecture
description: An architecture style where systems react to events that describe something that happened.
tags:
  - messaging
  - architecture
---

**Event-driven architecture** connects systems through events — facts about something that already happened, such as `OrderCreated` or `PaymentFailed` — usually delivered over a [[message-queue|message queue]] or [[pub-sub|pub/sub]] channel.

## How it works

The defining inversion is that the producer doesn't know who consumes its events, or whether anyone does. It emits a fact and moves on. Consumers subscribe to the events they care about and react on their own schedule. This is the opposite of a command or request, where the caller names a specific recipient and waits for a result.

Events are typically past-tense and immutable: they record what happened, not what should happen next. One event can have many independent consumers — an `OrderCreated` event might trigger inventory reservation, a confirmation email, and an analytics update, each owned by a different service that the order service never references.

## When to use

It fits when one thing happening should trigger several loosely related reactions, especially across team or service boundaries, and when those reactions can tolerate running slightly later. It also lets you add new consumers without touching the producer — a strong fit for systems that keep growing new side effects on the same core events.

Avoid it for simple request/response flows where the caller needs an answer now. Wrapping a synchronous need in events adds latency and indirection without buying decoupling.

## Trade-offs

You gain loose coupling and extensibility, but you lose the straight-line readability of a call stack: the logic for "what happens when an order is placed" is now scattered across many subscribers and is only visible at runtime. Debugging requires tracing an event through systems rather than reading one function.

## Pitfalls

Without [[idempotency|idempotent]] handlers, redelivery doubles side effects. Without clear, versioned event contracts, a producer changing a field silently breaks consumers it doesn't know exist. And weak observability turns a missed reaction into a mystery — there's no exception at the producer to point at, so [[../observability/correlation-id|correlation IDs]] and tracing across the event flow are not optional extras here but the only way to follow cause and effect.
