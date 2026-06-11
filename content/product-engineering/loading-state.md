---
title: Loading state
description: The UI shown while data, code, or an action is still in progress.
tags:
  - product-engineering
  - frontend
---

A **loading state** tells users that work is in progress and the interface has not stalled.

Good loading states match the scope of the work: a button spinner for a single action, a skeleton for content that is about to appear, and a page-level state for navigation or full-screen loading.

Loading states should avoid layout jumps, preserve nearby context, and make repeated actions harder when a request is already in flight.

They are closely related to [[error-retry-ux|error retry UX]], [[optimistic-ui|optimistic UI]], and [[../react/suspense|Suspense]].
