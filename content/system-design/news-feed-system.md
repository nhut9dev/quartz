---
title: News feed system
description: A system that ranks and delivers posts or events to a user's feed.
tags:
  - system-design
  - product
---

A **news feed system** decides what items a user should see and in what order.

Fan-out on write precomputes feeds when someone posts. Fan-out on read computes the feed when a user opens it. Many real systems mix both: precompute for normal users and handle high-follower accounts differently.

Key trade-offs include freshness, ranking quality, storage cost, privacy filtering, and duplicate suppression. Start with [[fan-out|fan-out]] before choosing storage and ranking layers.
