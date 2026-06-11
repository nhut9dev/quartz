---
title: Log level
description: A severity label that helps control and filter log output.
tags:
  - observability
---

A **log level** describes how important a log event is.

Common levels include `debug`, `info`, `warn`, `error`, and `fatal`.

Good log levels make [[structured-logging|logs]] easier to filter during incidents without filling production systems with noisy details.

Use `error` for failed operations that need attention, `warn` for unusual but handled cases, and `debug` for details usually disabled in production.
