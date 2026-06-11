---
title: WebRTC
description: Peer-to-peer real-time audio, video, and data exchanged directly between browsers.
tags:
  - web
  - realtime
  - networking
---

**WebRTC** lets two browsers stream audio, video, and arbitrary data *directly* to each other, peer-to-peer, without routing the media through a server. It's the technology behind in-browser video calls and screen sharing — built-in, plugin-free, and low-latency because the bytes take the shortest path between the two peers.

## How it works

A peer connection can't bootstrap itself: the two browsers first exchange connection details (codecs, IP candidates) through a **signaling server** — any out-of-band channel you control, often a [[websocket|WebSocket]]. Signaling only brokers the introduction; once peers know how to reach each other, media flows directly between them.

Reaching each other is the hard part, because most peers sit behind [[../../networking/nat|NAT]]. A **STUN** server tells a peer its own public address so it can be reached. When NAT is too strict for a direct path, a **TURN** server relays the traffic as a fallback — slower and bandwidth-heavy, but it always works. Beyond media, *data channels* carry arbitrary bytes peer-to-peer, useful for game state, file transfer, or chat.

## When P2P beats a relay

Going direct cuts latency and offloads bandwidth from your servers — ideal for one-to-one calls or small groups. But P2P scales badly: every peer must send to every other peer, so an N-person room means N² streams. Past a handful of participants, a media server (SFU) that fans out one upload to many downloads wins. So WebRTC is peer-to-peer in spirit but often server-assisted in practice.

## Pitfalls

The signaling protocol is yours to design — WebRTC defines none. You almost always need a TURN server in production (some networks block everything else), and TURN bandwidth costs real money. NAT traversal failures, codec mismatches, and per-browser quirks make connection setup the fragile step.
