---
title: React Profiler
description: Measuring which components render and why, instead of guessing.
tags:
  - react
  - performance
---

The **React Profiler** records what happened during each render commit so you can optimize from evidence rather than intuition.

The React DevTools Profiler tab records a session and shows, for every commit, which components rendered, how long they took, and *why* they rendered — a prop changed, state changed, a hook changed, or the parent re-rendered. This is usually the fastest way to find an unnecessary [[re-render|re-render]] cascade.

There is also a `<Profiler>` component for programmatic timing in code, useful for logging render cost in CI or production samples.

```jsx
<Profiler id="Sidebar" onRender={(id, phase, actualDuration) => log(id, phase, actualDuration)}>
  <Sidebar />
</Profiler>
```

The library `why-did-you-render` complements this by warning at runtime when a component re-rendered with structurally equal props. The discipline is the same in both: **measure before you memoize**. Sprinkling [[react-memo|React.memo]], [[use-memo|useMemo]], and [[use-callback|useCallback]] everywhere adds its own comparison cost and complexity, so confirm the bottleneck first — often the real fix is [[context-performance|splitting a context]] or moving state down, not memoization.
