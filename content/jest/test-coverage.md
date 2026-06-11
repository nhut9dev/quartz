---
title: Test coverage
description: A measurement of which code ran while tests executed.
tags:
  - jest
  - testing
---

**Test coverage** measures which lines, branches, functions, and statements ran during the test suite.

```txt
Statements   92%
Branches     81%
Functions    88%
Lines        93%
```

Coverage helps find untested areas, but it does not prove the assertions are meaningful. A test can execute a line without checking the behavior that matters.

Use coverage as a signal, not a goal by itself. High-risk code deserves focused tests even when the overall percentage already looks good.
