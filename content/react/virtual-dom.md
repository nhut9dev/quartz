---
title: Virtual DOM
description: An in-memory tree of React elements describing what the UI should look like.
tags:
  - react
  - rendering
---

The **virtual DOM** is an in-memory tree of React elements that describes what the UI should look like, separate from the actual browser DOM.

On a [[re-render|re-render]], React builds a new element tree from your components and [[jsx|JSX]], then diffs it against the previous tree to compute the minimal set of real-DOM changes.

This is why you write declarative UI — you describe the result for the current state, and React figures out the efficient updates rather than you editing nodes by hand.

The comparison-and-apply step is called [[reconciliation|reconciliation]]. The virtual DOM is what makes it cheap: comparing plain objects in memory is far faster than touching the real DOM, which only changes where something actually differs.

See [[react-introduction|React]] for the bigger picture of how this fits together.
