---
title: Web push
description: Server-initiated notifications delivered to a service worker even when the page is closed.
tags:
  - web
  - notifications
---

**Web push** lets a server send notifications to a user's device even when no tab is open, delivered through a [[service-worker|service worker]] rather than the page. The page first asks for permission and subscribes via the Push API, which returns a subscription endpoint, a URL on the browser vendor's push service plus encryption keys. The server stores that subscription and sends messages to it.

```js
const sub = await registration.pushManager.subscribe({ userVisibleOnly: true })
```

When a message arrives, the browser wakes the service worker's `push` event, which typically calls `showNotification`. Messages are encrypted and authenticated (commonly with VAPID), so only your server can push to a subscription. Use web push for re-engagement and timely alerts, but request permission only after the user understands why.
