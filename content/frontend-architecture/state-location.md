---
title: State location
description: Deciding where frontend state should live.
tags:
  - frontend-architecture
  - react
---

**State location** is the decision of where a piece of UI or application state should live.

State can be local to a component, [[lifting-state-up|lifted to a parent]], stored in [[react-context|context]], managed by a client-state library such as [[zustand|Zustand]] or [[redux-toolkit|Redux Toolkit]], or handled as [[server-state|server state]].

Keep state as close as possible to the components that need it. Move it upward or outward when multiple parts of the app genuinely need to coordinate.

The wrong location creates either prop chains, duplicate state, unnecessary rerenders, or global state that is hard to reason about.
