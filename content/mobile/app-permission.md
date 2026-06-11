---
title: App permission
description: User-granted access to protected mobile device capabilities.
tags:
  - mobile
  - security
---

An **app permission** is user-granted access to protected device capabilities such as camera, photos, location, contacts, microphone, Bluetooth, or notifications.

Permissions are part of mobile privacy and security. Apps must explain why access is needed and handle denial gracefully.

```txt
ask -> granted
ask -> denied
ask -> blocked or restricted
```

Permission behavior differs between [[ios|iOS]] and [[android|Android]], so cross-platform apps need platform-aware handling and clear fallback UI.
