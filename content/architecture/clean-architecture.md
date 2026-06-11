---
title: Clean architecture
description: Separating business rules from frameworks, databases, and delivery mechanisms.
tags:
  - architecture
---

**Clean architecture** keeps core business rules independent from external details like frameworks, databases, and HTTP handlers.

The inner code describes use cases and domain rules. The outer code adapts those rules to tools such as [[../database/orm|ORMs]], queues, and web controllers.

This separation can make critical logic easier to test and move across delivery mechanisms.

It adds ceremony, so it is most useful when the domain logic is important enough to justify the extra boundaries.
