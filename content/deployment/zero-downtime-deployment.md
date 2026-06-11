---
title: Zero-downtime deployment
description: Shipping a new version without dropping in-flight requests or showing users an outage.
tags:
  - deployment
---

A **zero-downtime deployment** replaces a running version with a new one while keeping the service continuously available to users.

A naive deploy stops the old process and starts the new one, leaving a gap where requests fail. Zero-downtime deployment closes that gap.

The pattern brings up new instances, confirms they pass a [[health-check|health check]], shifts traffic to them, and only then drains and stops the old instances. Draining lets in-flight requests finish before shutdown.

This requires the application to handle two versions running side by side, so database changes must be backward compatible.

If the new version misbehaves, traffic can shift back for an instant [[rollback]].

Strategies like [[blue-green-deployment|blue-green]] and [[canary-deployment|canary]] deployment are common ways to achieve it.
