---
title: Code coverage
description: The percentage of code executed by the test suite.
tags:
  - testing
---

**Code coverage** measures how much of your code runs while the test suite executes, reported as a percentage.

Common flavors are line coverage and branch coverage, which tracks whether each side of every conditional was taken.

Coverage is useful for finding untested code: a file at zero percent is clearly unguarded.

The big gotcha is that high coverage does not mean good tests. Code can be executed without any meaningful assertion, so a test that runs a function but checks nothing still counts.

Treat coverage as a floor to investigate, never a goal to chase.
