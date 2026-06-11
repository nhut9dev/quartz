---
title: Error handling strategy
description: A layered approach to errors using boundaries, fallbacks, retries, and reporting.
tags:
  - frontend-architecture
---

**Error handling strategy** is a layered plan for what the UI does when something fails, rather than scattering ad hoc try/catch blocks.

At the render layer, an [[../react/error-boundary|error boundary]] catches crashes and shows a fallback instead of a blank screen.

At the data layer, failed requests get retries, timeouts, and clear empty or error states the user can recover from.

At the observability layer, errors are reported to a monitoring service so real failures are visible, not silent.

The benefit is predictable, recoverable failures across the whole app.

The key tradeoff is honesty: never swallow an error to make a screen look fine. Surface it, log it, and let the user retry.
