---
title: Portal
description: createPortal renders children into a different DOM node while keeping them in the React tree.
tags:
  - react
  - dom
---

A **portal** lets `createPortal` render children into a different DOM node, outside the parent's place in the DOM hierarchy.

```jsx
createPortal(<Modal />, document.body)
```

Visually the children appear under whatever DOM node you target, but in the React tree they stay where you wrote them. That means [[react-context|context]] still flows in, and events still bubble up to their React parent rather than the DOM parent.

This is useful for modals, tooltips, dropdowns, and overlays — UI that must escape a parent's `overflow: hidden` or `z-index` stacking context to render on top of everything.

So a portal changes *where* a [[react-component|component]] lands in the DOM without changing *where* it lives in your component logic.
