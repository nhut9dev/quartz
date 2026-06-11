---
title: Trace Viewer
description: Playwright's tool for inspecting recorded test execution.
tags:
  - playwright
  - testing
  - debugging
---

**Trace Viewer** is Playwright's tool for inspecting a recorded test run. A trace can include screenshots, DOM snapshots, console logs, network requests, actions, and assertion steps.

```txt
npx playwright show-trace trace.zip
```

Traces are especially useful for debugging CI failures because they show what the browser saw when the test failed.

Enable tracing for retries or failed tests so the normal test run stays lighter while still preserving evidence for failures.
