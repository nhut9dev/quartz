---
title: Parallel route
description: A Next.js App Router feature for rendering multiple route slots at the same level.
tags:
  - nextjs
---

A **parallel route**, an [[app-router|App Router]] feature, renders more than one route slot within the same [[layout-template|layout]].

It is useful for dashboards, split views, modals, and interfaces where independent panels change separately.

Parallel routes add routing power, but they also make mental models more complex. Use them when independent route state is genuinely needed.
