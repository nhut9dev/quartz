---
title: Feature-Sliced Design
description: A frontend architecture approach that organizes code by product features and layers.
tags:
  - frontend-architecture
---

**Feature-Sliced Design** is a way to organize frontend applications around product features and architectural layers.

Common layers include app setup, pages, widgets, features, entities, and shared code.

The goal is to make dependencies flow in one direction and keep feature code close to the behavior it supports, with each layer acting as a clear [[component-boundary|boundary]].

It is most useful when a frontend app has many routes, teams, or product areas. For small apps, a simpler feature-based [[folder-structure|folder structure]] is often enough.
