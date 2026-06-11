---
title: Correlation ID
description: An identifier used to connect logs and events from the same request or workflow.
tags:
  - observability
---

A **correlation ID** is a value passed through a request or workflow so related events can be found together.

It is commonly added to [[structured-logging|structured logs]], HTTP headers, queue messages, and error reports.

Correlation IDs are useful when a request crosses multiple services but full [[tracing|distributed tracing]] is not available.

They should be generated at the system edge when missing and propagated consistently through internal calls.
