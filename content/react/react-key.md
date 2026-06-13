---
title: key
description: A stable identity React uses when rendering lists.
tags:
  - react
  - rendering
---

A **key** gives React a stable identity for each item in a rendered list. It helps React understand which items were added, removed, or moved.

```jsx
users.map(user => (
  <li key={user.id}>{user.name}</li>
))
```

Use a stable ID from the data whenever possible. Avoid array indexes as keys when items can be inserted, deleted, sorted, or filtered, because indexes describe position rather than identity.

Keys are only meaningful to React during [[list-rendering|list rendering]]. They are not passed to the child component as a normal [[props|prop]].

## How it works

During [[reconciliation|reconciliation]], React matches each element in the new tree to an element in the old tree to decide whether to update it in place or unmount/remount it. For a list of children, that match is made by `(type, key)` — with explicit keys, React can tell "the item that was at index 2 is now at index 0, but it's the *same* item" and moves its existing component instance and DOM node rather than treating it as a new one. Without stable keys (or with array-index keys on a list whose order changes), React falls back to matching by position: index 0's old element is compared to index 0's new element regardless of whether they represent the same data, so a reorder looks to React like "every item's props changed" rather than "the items moved."

## When to use

Use a stable identifier from the data — a database id, a UUID — for any list that can be reordered, filtered, sorted, or have items inserted/removed anywhere but the end. Index keys are acceptable only for lists that are static for the component's lifetime: never reordered, items only ever appended at the end, never filtered.

## Trade-offs

A stable key lets React preserve everything tied to that component instance across a reorder: local [[state|state]], focus, scroll position within the item, in-flight CSS transitions/animations. Index keys are simpler to write (`key={i}`) and avoid needing a unique id on every data item, but that simplicity is exactly what breaks when the list order isn't fixed.

## Pitfalls

With index keys, sorting or filtering a list of inputs makes each input keep *its position's* old state, not its data's — e.g. a checked checkbox stays checked on row 2 even though a different item is now rendered there, because React sees "index 2, same key, must be the same component" and reuses the DOM node with its existing checked state. The opposite problem is changing the key *unintentionally* — e.g. `key={Math.random()}` or a key derived from something that changes every render forces React to unmount and remount the component on every render, destroying its state and any focus/animation. That same behavior is also a deliberate pattern: setting `key={selectedUserId}` on a form component forces a full reset (fresh state, fresh mount) whenever the selected user changes, which is useful precisely because it's normally something to avoid.
