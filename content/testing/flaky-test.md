---
title: Flaky test
description: A test that passes and fails nondeterministically without code changes.
tags:
  - testing
---

A **flaky test** passes sometimes and fails other times on the same code, with no change between runs.

Common causes are timing and async issues, like waiting on a fixed delay instead of a real condition, shared state that leaks between tests, and test-order dependence.

Flakiness is corrosive: it trains the team to ignore red builds, which hides genuine failures.

The fix is to find the source of nondeterminism, not to add retries. Retries mask the problem and let it spread.

Flakiness is most common in [[end-to-end-test|end-to-end tests]], which is one reason to keep them few.

## How it works

Flakiness comes from a gap between what a test assumes is true at the moment it asserts and what's actually true at that moment. A fixed `sleep(500)` assumes an async operation always finishes within 500ms — true most of the time, false under load. Shared state — a database row, a global counter, a cache — assumes no other test touched it since setup. Order-dependence assumes a previous test's setup already ran. None of these assumptions are checked; they just usually hold.

## When to use

Treat any intermittent failure as a real bug — in the test or in the system — until proven otherwise. Reproduce it locally with repeated runs (Playwright's `--repeat-each`, Jest's `--runInBand` to rule out parallelism), then narrow down which assumption (timing, shared state, ordering) breaks. A failure that disappears under `--repeat-each=20` run individually but reappears when run alongside the full suite points at shared state, not timing.

## Trade-offs

Retries (`--retries=2`) get a red CI run back to green and unblock a release, trading a visible problem for a hidden one — the nondeterminism that caused the first failure is still there, now disguised as "passed on retry".

## Pitfalls

Once a suite has a reputation for flakiness, engineers start re-running failed jobs reflexively without reading why — at that point a genuine regression looks identical to a known-flaky failure, and it ships. This is also why the [[test-pyramid|test pyramid]] keeps the [[end-to-end-test|end-to-end]] layer thin: every flaky e2e test is a recurring tax on every PR, and the more of them there are, the faster "just re-run it" becomes the team's default response to red builds.
