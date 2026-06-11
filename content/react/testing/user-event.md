---
title: user-event
description: A testing utility for simulating realistic user interactions.
tags:
  - react
  - testing
---

`user-event` is a testing utility that simulates user interactions such as clicking, typing, tabbing, selecting, and uploading files.

```jsx
await user.click(screen.getByRole("button", { name: "Save" }))
await user.type(screen.getByLabelText("Email"), "ada@example.com")
```

It is usually more realistic than directly firing low-level DOM events because one user action can produce multiple browser events.
