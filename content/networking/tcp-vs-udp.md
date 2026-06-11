---
title: TCP vs UDP
description: Reliable ordered streams versus lightweight connectionless datagrams.
tags:
  - networking
---

**TCP and UDP** are the two main transport protocols, trading reliability against speed and overhead.

**TCP** sets up a connection, then delivers a reliable, ordered byte stream, retransmitting lost packets and controlling flow. It powers HTTP, email, and most request/response traffic.

**UDP** sends independent datagrams with no connection, no ordering, and no retransmission. It is lightweight and fast, used for DNS, video calls, and gaming.

The core tradeoff is reliability versus latency: TCP guarantees delivery but can stall on a lost packet, while UDP keeps moving but may lose or reorder data.

Newer stacks like [[http3-quic|HTTP/3 over QUIC]] build their own reliability on top of UDP to get both.
