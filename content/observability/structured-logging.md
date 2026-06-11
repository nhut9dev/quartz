---
title: Structured logging
description: Logging events as machine-readable fields instead of only free text.
tags:
  - observability
---

**Structured logging** records [[logging|logs]] as fields such as level, message, request ID, user ID, route, and duration.

Structured logs are easier to search, filter, group, and correlate, especially when joined with [[tracing|tracing]].

Avoid logging secrets, tokens, passwords, or sensitive personal data.
