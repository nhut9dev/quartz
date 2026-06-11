---
title: useEffect
description: A React hook for synchronizing a component with systems outside rendering.
tags:
  - react
  - hook
  - effect
---

`useEffect` is a React [[hook|hook]] for synchronizing a component with something outside render: subscriptions, timers, browser APIs, manual DOM work, or network requests.

```jsx
import { useEffect } from "react"

function PageTitle({ title }) {
  useEffect(() => {
    document.title = title
  }, [title])
}
```

## How it works

The effect runs *after* React has rendered and the browser has painted, not during render. React compares each value in the [[effect-dependency-array|dependency array]] with its previous value using `Object.is`; if any changed, it runs the [[effect-cleanup|cleanup]] from the last run and then the effect again. With an empty array it runs once after mount; with no array it runs after every render. In development [[react/strict-mode|Strict Mode]] React mounts, unmounts, and remounts once on purpose, so the effect runs twice — a test that your cleanup is correct, not a bug.

## When not to use one

Most code people put in effects doesn't belong there. Transforming props or state for display is [[derived-state|derived state]] — compute it during render. Responding to a user action belongs in a [[react-event-handler|event handler]], where you have the event and clearer intent. Resetting state when a prop changes is usually a [[react-key|key]] change, not an effect. Reach for `useEffect` only when you genuinely need to reach an external system.

## Pitfalls

Omitting a dependency captures a **stale closure** — the effect keeps seeing the first render's values. Passing an object or array literal as a dependency makes it new every render, so the effect loops. Fetching in an effect invites race conditions when inputs change quickly; cancel stale requests in cleanup with an [[../dom/abort-controller|AbortController]], or move data loading to [[data-fetching/server-state|a server-state library]] or [[data-fetching/suspense-data|Suspense]].
