---
title: FlatList
description: A React Native component for efficient scrollable lists.
tags:
  - react-native
  - component
  - performance
---

`FlatList` renders long, scrollable lists efficiently by virtualizing rows. It only keeps a window of items mounted instead of rendering the whole collection at once.

```jsx
<FlatList
  data={users}
  keyExtractor={user => user.id}
  renderItem={({ item }) => <Text>{item.name}</Text>}
/>
```

Use `FlatList` for feeds, search results, messages, and any list that can grow.

Like React web [[list-rendering|list rendering]], stable keys matter. `keyExtractor` should return an identity from the data, not an array index when items can reorder.

## How it works

`FlatList` keeps a "window" of rendered rows around the visible area — controlled by `windowSize` (in multiples of the viewport size) — and mounts/unmounts rows as the user scrolls past that window, recycling the underlying native views rather than keeping every row alive. `initialNumToRender` controls how many rows render on first paint (before any scrolling), and `maxToRenderPerBatch` controls how many additional rows render per scroll-driven batch. If row heights are known ahead of time, `getItemLayout` lets `FlatList` skip measuring each row, which both speeds up initial render and enables features like `scrollToIndex`.

## When to use

Use `FlatList` for any list long enough that rendering every item up front would be wasteful — feeds, search results, chat messages, anything that can grow past a couple dozen items. For short, fixed-length lists (a settings screen with ten rows), a plain `.map()` inside a `ScrollView` is simpler and avoids the recycling behavior entirely — there's nothing to virtualize.

## Trade-offs

Virtualization keeps memory and render cost roughly constant regardless of list length, which is essential for long feeds — but rows are not permanently mounted. A row that scrolls out of the window and back in is a **new instance**, so any state held inside that row's component (an expanded/collapsed flag, a text input's local value) is lost unless that state lives in the parent list's data, not the row. Heavy `renderItem` components also still cost what they cost — virtualization bounds *how many* rows render, not how expensive each one is, so a slow `renderItem` still causes scroll jank.

## Pitfalls

The most common production bug is local state inside `renderItem` that silently resets when a row is recycled — e.g. a "show more" toggle per item that reverts when scrolling away and back. The fix is to store that state in the list's data (keyed by item id) rather than in the row component. The second common issue is the same as web [[react-key|keys]]: an unstable or index-based `keyExtractor` causes rows to show the wrong data after the underlying list reorders or items are removed. Finally, nesting a `FlatList` inside a `ScrollView` (or another `FlatList`) triggers React Native's "VirtualizedLists should never be nested inside plain ScrollViews" warning — the outer scroll container forces the inner list to render its full content, defeating virtualization entirely.
