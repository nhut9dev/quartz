---
title: Logging
description: Recording runtime events so an application can be debugged and operated.
tags:
  - deployment
  - observability
---

**Logging** records runtime events from an application. Logs help developers understand errors, requests, background jobs, deploys, and unusual behavior.

Good logs include enough context to debug a problem: timestamps, severity, request ids, user or tenant ids when appropriate, and structured fields.

Logs should not contain secrets, passwords, access tokens, or unnecessary personal data.
