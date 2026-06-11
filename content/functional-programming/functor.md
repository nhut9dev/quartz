---
title: Functor
description: A container you can map over while preserving its structure.
tags:
  - functional-programming
---

A **functor** is a container you can `map` over, applying a function to the values inside while preserving the container's structure.

In JavaScript, arrays are functors: `[1, 2].map(f)` returns a new array of the same shape. Promises behave similarly, with `.then` mapping over an eventual value.

The point is that you transform contents without unwrapping the container or caring how many values it holds. The structure stays intact.

A lawful `map` must do nothing when given the identity function, and composing two maps must equal mapping the composed function.

Functors are the gentle on-ramp to the more powerful [[monad|monad]].
