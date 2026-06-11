---
title: Input validation
description: Checking external data before trusting or storing it.
tags:
  - security
---

**Input validation** checks data from users, clients, APIs, files, queues, and environment variables before the application trusts it.

Validation should verify shape, type, size, allowed values, and business rules.

[[html-form-validation|Client-side validation]] improves user experience, but server-side validation is the security boundary. A client can be bypassed or modified.

Validation pairs well with explicit schemas, clear error messages, and separate authorization checks.
