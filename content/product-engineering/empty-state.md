---
title: Empty state
description: The UI shown when a valid view has no data to display.
tags:
  - product-engineering
  - frontend
---

An **empty state** is shown when a view is valid but has no data yet.

It should explain the current state through useful labels and actions, not through generic filler text. A first-use empty state often needs a creation action, while a filtered empty state usually needs a way to clear or adjust filters.

Empty states are not errors. They should feel stable and intentional, especially in dashboards, tables, inboxes, and search results.

They often sit beside [[loading-state|loading states]] and [[error-retry-ux|error states]] in a complete UI state model.
