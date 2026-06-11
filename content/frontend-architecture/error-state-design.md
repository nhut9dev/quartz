---
title: Error state design
description: Planning how screens behave when data loading or user actions fail.
tags:
  - frontend-architecture
  - ux
---

**Error state design** defines what users see and can do when something fails.

Good error states explain the problem at the right level, preserve user input when possible, and offer a useful next action.

They should be designed alongside loading, empty, and success states instead of added after implementation.

This is especially important for forms, data fetching, file uploads, and workflows that call external services.
