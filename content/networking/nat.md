---
title: NAT
description: Network address translation mapping private addresses to a public one.
tags:
  - networking
---

**NAT (network address translation)** lets many devices on a private network share a single public [[ip-address|IP address]] by rewriting addresses and ports as traffic crosses the router.

When a device sends a packet out, the router swaps the private source address for its public one and remembers the mapping, so replies can be routed back to the right device.

It matters because it conserves scarce IPv4 addresses and incidentally hides internal hosts from the public internet.

The tradeoff is that inbound connections are hard: an outside host cannot directly reach a device behind NAT without port forwarding or hole-punching.

This complicates peer-to-peer apps and is one reason IPv6, with its huge address space, reduces the need for NAT.
