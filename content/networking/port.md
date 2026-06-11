---
title: Port
description: A number identifying a specific service or endpoint on a host.
tags:
  - networking
---

**A port** is a 16-bit number that identifies a specific service or connection endpoint on a host, so one machine can run many network services at once.

An [[ip-address|IP address]] gets a packet to the right machine; the port gets it to the right program on that machine.

Well-known ports are conventional: 80 for HTTP, 443 for HTTPS, 53 for [[../web/dns|DNS]], 22 for SSH.

A connection is identified by the combination of source and destination IP plus port, which lets many simultaneous connections coexist.

The practical tradeoff is coordination: services must agree on or advertise their ports, and firewalls control which ports are reachable from outside.
