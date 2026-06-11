---
title: Same-origin policy
description: The browser rule that isolates documents from different origins.
tags:
  - web
  - browser
  - security
---

The **same-origin policy** is a browser security rule that limits how a page from one origin can interact with another origin. It's the default isolation that stops a malicious site from reading data out of your logged-in accounts opened in the same browser.

## What an origin is

An origin is the triple of **scheme + host + port**. `https://app.example.com` and `https://api.example.com` are different origins (different host); so are `http://` and `https://` versions of the same host (different scheme). Same origin means all three match exactly.

## What it restricts — and doesn't

It blocks cross-origin *reads*: JavaScript can't read another origin's response body, reach into its DOM, or read its cookies and storage. Crucially it does **not** block cross-origin *sends* — your page can still submit a form, load an image, or include a script from anywhere. That asymmetry is exactly why [[csrf|CSRF]] exists: the request goes through (with [[cookie|cookies]] attached), even though the attacker can't read what comes back.

## Relaxations

[[cors|CORS]] is the controlled opt-in that lets a server permit specific cross-origin reads. `postMessage` allows deliberate cross-origin communication between windows, and newer headers (CORP, COEP, COOP) tighten or loosen isolation for features like `SharedArrayBuffer`. None of these turn the policy off — they widen specific, declared holes.
