---
title: Effect dependency array
description: The list of values that decides when a useEffect runs again.
tags:
  - react
  - hook
  - effect
---

The **dependency array** is the second argument to [[use-effect|useEffect]]. It lists the values the effect reads from the component scope.

```jsx
useEffect(() => {
  document.title = title
}, [title])
```

When one dependency changes between renders, React runs the effect again. An empty array means the effect does not depend on changing component values.

```jsx
useEffect(() => {
  console.log("mounted")
}, [])
```

Do not remove dependencies just to stop an effect from running. That usually creates stale closures. Instead, change the code so the effect truly depends on fewer values, or move event-driven work into a [[react-event-handler|React event handler]].

## How it works

After every render, React compares each entry in the dependency array to its value from the previous render using `Object.is` — the same check `===` does. If every entry is equal, the effect is skipped entirely; if any one differs, the [[effect-cleanup|cleanup]] from last time runs, then the effect body runs again with the new values. Crucially, this is a *reference* comparison: an object, array, or function literal created inline in the component body is a brand-new reference on every render, so it is never `Object.is`-equal to "itself" from the previous render — a dependency like `{ id }` or `() => {...}` written fresh each render makes the effect run on *every* render, regardless of whether `id` actually changed.

## When to use

Always run with `eslint-plugin-react-hooks`'s `exhaustive-deps` rule on — it's the canonical, mechanically-checked guide for what belongs in the array. The array isn't a "when should this run" knob to tune by hand; it's a true list of every reactive value the effect's body reads. If you want the effect to run less often, the lint rule is telling you to either remove the dependency from the effect's logic (read it via a ref instead) or memoize the value so its reference stays stable.

## Trade-offs

An exhaustive, lint-enforced dependency array guarantees the effect never runs against stale values — at the cost of effects re-running more often than feels necessary when dependencies are objects/functions that get recreated on every render. The "fix" usually isn't to shrink the array, it's to stabilize what's *in* the array with [[use-memo|`useMemo`]]/[[use-callback|`useCallback`]] or by moving the value's construction outside the component, so the array stays exhaustive but the values it watches don't churn.

## Pitfalls

The most common production bug is the *infinite effect loop*: an effect depends on an object or function that's created fresh on every render, and the effect itself calls `setState` — each render recreates the dependency, which re-triggers the effect, which calls `setState`, which triggers a render, forever. The second most common is silencing the lint rule with `// eslint-disable-next-line react-hooks/exhaustive-deps` to "fix" the first problem — this produces a [[../javascript/functions/closure|stale closure]]: the effect captures the *first* render's values and keeps using them even as the component re-renders with new ones, a bug that often doesn't surface until a user interacts with the component a second time.
