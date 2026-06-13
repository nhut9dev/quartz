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

## How it works

The diff is a tree walk with a small set of rules, not a generic algorithm. At each position, React compares element *type*: if the type is the same (`<div>` to `<div>`, `<UserCard>` to `<UserCard>`), React keeps the existing instance and DOM node and just updates changed props/attributes, then recurses into children. If the type changed (`<div>` to `<span>`, or one component to another), React discards the old subtree entirely — unmounting it, running cleanup, losing its state — and mounts the new one fresh. For lists of children, this position-based matching is exactly what [[react-key|`key`]] overrides: with keys, React matches old and new children by key instead of by position, so reordering data reorders DOM nodes (and preserves their state) instead of mutating each position's content in place.

## When to use

You don't choose to use the virtual DOM — it's how React's `render` works under the hood. It's useful to understand as the *contrast point* for other architectures: fine-grained reactive frameworks (Solid, Svelte, Vue's reactivity) skip the diffing step by compiling templates into code that updates exactly the DOM nodes a changed value touches, with no tree comparison at all. Understanding the virtual DOM model explains why React's mental model is "describe the result, React figures out the update" rather than "describe exactly what changed."

## Trade-offs

Diffing plain JS objects in memory is much cheaper than touching the real DOM, which is the headline benefit — but it is not *free*. A re-render still walks and diffs the whole subtree below the component that changed, proportional to that subtree's size, even if the diff ultimately decides nothing needs to change in the DOM. This is the gap [[../react/react-memo|`React.memo`]], [[use-memo|`useMemo`]], and scoping state lower in the tree exist to close — they skip the diff for subtrees that can't have changed, rather than relying on the diff itself being free.

## Pitfalls

"Virtual DOM makes React fast" is a common oversimplification — the actual performance win is *avoiding unnecessary real-DOM writes* (layout, paint), not the diffing step being instant. A component that re-renders a large, unmemoized tree on every keystroke still pays real diffing cost every time, which is why "it's just comparing objects, so it's free" leads people to skip memoization and [[../react/list-virtualization|virtualization]] on lists that turn out to be the actual bottleneck.
