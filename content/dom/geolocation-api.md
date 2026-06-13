---
title: Geolocation API
description: Getting the user's current or continuously-updated position.
tags:
  - dom
  - browser
---

The **Geolocation API** (`navigator.geolocation`) gets the user's current position via `getCurrentPosition()` for a one-shot read, or `watchPosition()` for continuous updates — using GPS, Wi-Fi, or IP-based location depending on device and permission.

```js
navigator.geolocation.getCurrentPosition(
  pos => console.log(pos.coords.latitude, pos.coords.longitude),
  err => console.error(err)
)
```

It requires a secure context (HTTPS) and explicit user permission via a browser prompt — denial or timeout calls the error callback, not the success callback, so both must be handled.

`watchPosition()` keeps firing as the device moves and must be paired with `clearWatch()` on cleanup — otherwise it keeps the GPS active, and battery draining, after the component that requested it is gone.
