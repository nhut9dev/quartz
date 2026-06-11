---
title: Refresh token
description: A long-lived credential used to request new short-lived access tokens.
tags:
  - security
  - auth
---

A **refresh token** is used to obtain a new access token after the current access token expires.

This lets applications keep access tokens short-lived while avoiding a full login every few minutes.

Refresh tokens need stronger protection than access tokens because they often live longer. Store them carefully, rotate them when used, and revoke them on logout or suspicious activity.

In browser apps, a [[secure-cookie|secure HTTP-only cookie]] is often safer than exposing refresh tokens to JavaScript.
