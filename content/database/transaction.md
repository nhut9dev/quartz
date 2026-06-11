---
title: Transaction
description: A group of database operations that succeed or fail together.
tags:
  - database
---

A **transaction** groups database operations so they succeed or fail together.

For example, transferring money between accounts should debit one account and credit the other in the same transaction. If either operation fails, the database should roll the whole change back.

Transactions protect data consistency when a workflow spans multiple writes. They are especially important for payments, inventory, permissions, and counters.
