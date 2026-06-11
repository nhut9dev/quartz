---
title: End-to-end test
description: A test that exercises a user workflow through the full application stack.
tags:
  - playwright
  - testing
---

An **end-to-end test** exercises a user workflow through the running application. It usually opens a browser, navigates through the UI, interacts with pages, and checks visible results.

```txt
browser -> frontend -> API -> database
```

E2E tests catch broken wiring across layers: routing, rendering, API contracts, auth, forms, and deployment-like configuration.

They are slower and more expensive than [[testing/unit-test|unit tests]], so use them for critical workflows rather than every small branch.
