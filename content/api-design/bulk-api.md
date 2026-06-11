---
title: Bulk API
description: An API endpoint that processes many items in one request.
tags:
  - api
  - performance
---

A **bulk API** lets clients create, update, delete, or fetch many items at once.

It reduces round trips and can simplify batch workflows, but it complicates validation, partial failure, response shape, idempotency, and rate limiting.

Decide whether the request is atomic. All-or-nothing behavior is simpler for clients, while partial success can be more efficient. Either way, failures must identify the affected item clearly.
