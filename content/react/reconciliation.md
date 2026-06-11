---
title: Reconciliation
description: The process React uses to compare the previous and next virtual DOM and apply only the differences.
tags:
  - react
  - rendering
---

**Reconciliation** is the process React uses to compare the previous and next [[virtual-dom|virtual DOM]] and apply only the differences to the real DOM.

On each [[re-render|re-render]] React produces a new element tree and diffs it against the previous one. Rather than a general (expensive) tree-diff, it uses a fast heuristic built on two assumptions: elements of different types produce different trees, and a stable [[react-key|key]] tells React which children are the same across renders.

## How it works

React walks both trees together and matches elements by **type and position**. Same type at the same spot → it keeps the existing DOM node and only updates changed props. Different type → it unmounts the old node and its whole subtree and builds a new one from scratch, discarding that subtree's state.

The current engine is **Fiber**. Each element becomes a fiber node, and the diff is split into small units of work React can pause, resume, and prioritize — the foundation that makes [[concurrent-rendering|concurrent rendering]] possible. Reconciliation decides *what* changed; the commit phase then applies it to the DOM in one synchronous pass.

## Keys and lists

In a [[list-rendering|list]], position alone is unreliable once items are inserted, removed, or reordered — by position, "the second row" may now be a different item, so React updates the wrong nodes. A stable key gives each item an identity that survives reordering, letting React move and reuse nodes instead of recreating them (and losing their input state, focus, or scroll).

## Pitfalls

Using the array index as a key reintroduces the position problem and causes subtle state bugs on reorder. Changing an element's type — even defining a component *inside* render so it's a new function on every pass — forces a full remount, throwing away the subtree's state and DOM. Keep structure and component identity stable so reconciliation can take its cheap path.
