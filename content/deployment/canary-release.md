---
title: Canary release
description: Gradually rolling out a change to a small part of traffic before wider release.
tags:
  - deployment
---

A **canary release** sends a new version to a small percentage of users, servers, tenants, or regions first.

Teams watch [[../observability/metrics|metrics]], logs, errors, and user impact before increasing exposure.

Canaries reduce blast radius because a bad change affects fewer users at first.

They work best with automated rollback, clear health signals, and compatibility between old and new versions.
