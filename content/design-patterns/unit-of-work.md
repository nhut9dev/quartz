---
title: Unit of work
description: Tracking objects changed during a business transaction and committing them as one atomic write.
tags:
  - design-patterns
  - database
---

The **unit of work** pattern tracks every object created, modified, or deleted during a business transaction and writes them all in a single atomic database commit.

## How it works

As the business logic runs, the unit of work registers dirty objects instead of writing each one immediately. A *flush* pushes the pending changes to the database within the open transaction; a *commit* finalizes that transaction. Keeping flush and commit distinct lets you flush mid-transaction (to read back generated IDs, for example) while still rolling everything back if a later step fails. An accompanying identity map ensures each row loads into memory once, so repeated lookups return the same object and edits never conflict.

## When to use

Reach for it whenever a single use case touches several entities and they must succeed or fail together. It pairs naturally with the [[repository|Repository]] pattern: repositories express *what* to load and save, while the unit of work decides *when* to flush them inside one [[../database/transaction|transaction]].

## Tradeoffs

The payoff is avoiding scattered writes, where each method commits on its own and leaves the database half-updated after a failure. The cost is a stateful object that must be scoped carefully to one request or operation; a long-lived or shared unit of work leaks changes between transactions.
