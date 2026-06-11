---
title: HTTP/3 and QUIC
description: HTTP/3 running over QUIC on UDP to avoid head-of-line blocking.
tags:
  - networking
---

**HTTP/3** runs over **QUIC**, a transport protocol built on [[tcp-vs-udp|UDP]] that bundles encryption and stream multiplexing into one layer.

QUIC keeps streams independent, so a lost packet stalls only its own stream rather than blocking all of them, the head-of-line problem that limited [[http2|HTTP/2]] on TCP.

It also folds the [[tls-handshake|TLS handshake]] into the connection setup, cutting round trips and making connections faster to establish.

Because connections are identified independently of the IP address, they can survive a network change, like switching from Wi-Fi to cellular.

The tradeoff is complexity and newness: QUIC reimplements reliability in userspace and needs UDP traffic to be allowed by networks.
