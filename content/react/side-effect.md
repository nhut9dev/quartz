---
title: Side effect
description: Any work that reaches outside rendering, like network requests, timers, or DOM mutations.
tags:
  - react
  - rendering
---

A **side effect** is any work that reaches outside rendering: changing the DOM directly, network requests, timers, logging, or subscriptions.

Rendering must stay [[purity|pure]] — given the same inputs it should return the same JSX and do nothing observable on the side. So side effects do not belong in the render body, where they could run at unexpected times or repeat on every [[re-render|re-render]].

Instead, put them where React expects them. Effects that sync with external systems go in [[use-effect|useEffect]], which runs after render and can clean up. Effects triggered by user interaction go in [[react-event-handler|event handlers]], which run only when the event fires.

The rule of thumb: if it reads or writes something outside the component's own return value, it is a side effect and should live in an effect or a handler, never inline during render.
