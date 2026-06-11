---
title: Folder structure
description: How frontend code is grouped into directories and ownership boundaries.
tags:
  - frontend-architecture
---

**Folder structure** shapes how easily developers can find, change, and delete frontend code.

Common grouping styles include by file type, by route, by feature, and by domain.

Small apps can start simple. Larger apps benefit from folders that reflect product behavior and ownership instead of only technical categories, an idea pushed further by [[feature-sliced-design|Feature-Sliced Design]].

A good structure makes common changes local: a feature's components, [[custom-hook|hooks]], tests, and [[api-client|API calls]] should be close enough that the workflow is obvious.
