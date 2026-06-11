---
title: API key
description: A single secret string that identifies and authorizes a calling application.
tags:
  - web
  - auth
  - security
---

**An API key** is a single secret string that identifies and authorizes a calling application, not an individual user. The client sends it on each request, usually in a header or a query parameter, and the server checks it against known keys.

Keys are simple to issue and use, but coarse-grained: a key grants whatever access it is configured for, with no per-user scope. Treat it like a password. Keep it server-side, never embed it in client code, and rotate it immediately if it leaks.

They are common for service-to-service calls and for [[webhook|webhook]] verification, where the receiver checks a key or signature to confirm the sender.

Contrast this app-level secret with user-centric [[oauth|OAuth]], where each user grants scoped access. Like other credentials, an API key travels in an [[http-headers|HTTP header]].
