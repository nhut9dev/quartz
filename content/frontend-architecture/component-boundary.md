---
title: Component boundary
description: The responsibility line between one UI component and the code around it.
tags:
  - frontend-architecture
  - react
---

A **component boundary** defines what a component owns and what it receives from outside.

Good boundaries keep rendering, interaction, data loading, and business rules from becoming tangled in one place.

For example, a reusable button should not know about checkout rules. A checkout form may know about checkout [[state-location|state]], validation, and submission. Composing small components through [[component-composition|composition]] keeps each boundary focused.

When a component becomes hard to test or reuse, check whether it owns too many responsibilities or receives data in the wrong shape.
