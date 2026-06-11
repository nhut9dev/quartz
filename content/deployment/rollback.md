---
title: Rollback
description: Returning a running system to a previous known-good release.
tags:
  - deployment
---

A **rollback** restores a previous release when a new deployment causes problems.

Good rollback plans include versioned build artifacts, database migration strategy, configuration history, and a quick way to switch traffic back.

Rollback is easiest when deployments are small and backward compatible. It becomes harder when a release changes persisted data in a way older code cannot read.

For risky releases, plan rollback before deploying, not after the incident starts.
