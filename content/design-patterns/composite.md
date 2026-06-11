---
title: Composite
description: Treating individual objects and compositions of objects uniformly via a tree.
tags:
  - design-patterns
---

The **composite** pattern arranges objects into a tree and lets clients treat individual objects and groups of objects through the same interface.

A *leaf* is a single element; a *composite* holds children that may themselves be leaves or composites. Both implement the same operations, so a call recurses through the whole tree.

Use it for hierarchies like file systems, UI component trees, menus, or organization charts, where part and whole should behave alike.

The tradeoff is that a shared interface can blur the line between things that contain children and things that do not.

The DOM and React component trees are familiar real-world composites.
