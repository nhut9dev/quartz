---
title: TextInput
description: React Native's component for editable text input.
tags:
  - react-native
  - component
  - form
---

`TextInput` is React Native's component for editable text input.

```jsx
const [email, setEmail] = useState("")

<TextInput
  value={email}
  onChangeText={setEmail}
  keyboardType="email-address"
/>
```

It is usually controlled with React [[state|state]], similar to a [[controlled-component|controlled component]] on the web.

Mobile inputs also need platform details: keyboard type, return key behavior, autocorrect, secure text entry, focus management, and avoiding the on-screen keyboard covering content.
