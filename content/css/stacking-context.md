---
title: Stacking context
description: A CSS rendering group that controls how elements layer on the z-axis.
tags:
  - css
---

A **stacking context** is a group of elements that are layered together as a unit, then compared with elements outside the group as a whole.

## What creates one

The root element forms the base context. After that, common triggers are `position` with a `z-index`, `opacity` below `1`, a `transform`, `filter`, or `perspective`, `will-change`, `isolation: isolate`, and a flex or grid child that has a `z-index`. Many of these are easy to add for unrelated reasons (a `transform` for an animation, `opacity` for a fade) and create a context as a side effect.

## How layering compares

`z-index` only orders siblings *within the same context*. A child can never escape its parent's layer: if the parent sits below another element, nothing the child does to its own `z-index` lifts it above that element. The comparison happens at the parent level first, then recurses inward.

## Pitfalls

The classic symptom is `z-index: 9999` doing nothing — the element is trapped inside an ancestor whose own stacking sits lower, so inspect the parents, not the number. Adding `opacity` or `transform` can unintentionally create a context and change layering elsewhere. And a `position: fixed` element stops being viewport-fixed if any ancestor has a `transform`, because that ancestor becomes its containing block.
