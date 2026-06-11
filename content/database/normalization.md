---
title: Normalization
description: A database design approach that reduces duplicated and inconsistent data.
tags:
  - database
---

**Normalization** organizes data so each fact is stored in one clear place.

Instead of storing a user's email on every order row, a normalized design stores the user in a `users` table and links orders with a [[foreign-key|foreign key]].

Normalization reduces update bugs and inconsistent records. The tradeoff is that reading data often requires [[join|joins]], which can make queries more complex.

Many production schemas are mostly normalized, with selective denormalization for performance-sensitive read paths.
