---
title: DNS
description: The system that resolves domain names to IP addresses before a request can be sent.
tags:
  - web
  - network
---

**DNS** (the Domain Name System) resolves human-readable domain names like `example.com` into the IP addresses machines actually connect to. It runs before any [[http|HTTP]] request can be sent: the browser must learn where to send the request first. A resolver walks the hierarchy from the root to the top-level domain to the domain's authoritative servers, which return records.

Common record types include `A` and `AAAA` for IPv4 and IPv6 addresses, `CNAME` for aliases, and `MX` for mail. Each record carries a TTL (time to live) that controls how long resolvers may cache it, so most lookups are answered from a nearby cache rather than a full walk. That caching makes the web fast but also means DNS changes propagate slowly, bounded by the TTL you set.
