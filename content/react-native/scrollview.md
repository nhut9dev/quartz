---
title: ScrollView
description: A React Native component for rendering scrollable content.
tags:
  - react-native
  - component
---

`ScrollView` renders scrollable content in React Native. It is useful when the content is limited and can be rendered all at once.

```jsx
<ScrollView>
  <ProfileHeader />
  <SettingsSection />
  <DangerZone />
</ScrollView>
```

`ScrollView` renders all children immediately. That can be expensive for long lists.

Use [[flatlist|FlatList]] when rendering many repeated items because it virtualizes rows and keeps memory usage lower.
