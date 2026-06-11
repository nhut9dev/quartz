---
title: Isolation level
description: A database setting that controls how concurrent transactions see each other's changes.
tags:
  - database
---

An **isolation level** controls what one transaction can observe while other transactions are running.

Stronger isolation reduces anomalies but can increase locking, waiting, or retry behavior.

Common levels include read committed, repeatable read, and serializable.

Choose isolation based on the data invariants the workflow must protect, not only on default settings.
