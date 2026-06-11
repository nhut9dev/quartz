---
title: IP address
description: A numeric identifier for a host on a network, in IPv4 or IPv6 form.
tags:
  - networking
---

**An IP address** is a numeric label that identifies a host on a network so packets can be routed to it.

**IPv4** uses 32-bit addresses written as four numbers, like `192.168.0.1`, giving about 4.3 billion addresses, which the internet has effectively run out of.

**IPv6** uses 128-bit addresses written in hexadecimal, like `2001:db8::1`, providing a practically unlimited supply.

Addresses can be public, routable across the internet, or private, used inside a local network and hidden behind [[nat|NAT]].

The tradeoff in the IPv4-to-IPv6 transition is compatibility: the two are not directly interoperable, so the internet still runs both side by side.

Humans usually reach hosts by name through [[../web/dns|DNS]], not by raw address.
