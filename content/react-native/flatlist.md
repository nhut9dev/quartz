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
