---
title: HTTP versions
description: How HTTP/1.1, HTTP/2, and HTTP/3 differ in how they move requests over the network.
tags:
  - web
  - http
---

The **HTTP versions** share the same [[http|HTTP]] semantics, methods, headers, and status codes, but differ in how they move requests over the wire. HTTP/1.1 sends one request at a time per connection, so browsers open several connections in parallel and still suffer head-of-line blocking.

HTTP/2 multiplexes many requests as concurrent streams over a single connection and compresses headers, removing much of that overhead and making request bundling tricks unnecessary. It still rides on TCP, so a single lost packet stalls every stream.

HTTP/3 moves to QUIC, a protocol built on UDP that handles streams independently, so packet loss on one stream no longer blocks the others. It also folds the [[tls|TLS]] handshake into the connection setup for faster starts. The version is negotiated automatically; you mostly benefit by serving over a modern server and CDN.

## How it works

HTTP/1.1 allows one in-flight request per connection (pipelining exists but is rarely used), so browsers open around six parallel connections per origin just to get concurrency — and each of those connections still blocks on its own response before reusing the slot. HTTP/2 multiplexes many requests as independent streams over a *single* TCP connection, removing the need for multiple connections — but TCP guarantees in-order delivery, so if one packet is lost, every stream on that connection stalls until it's retransmitted, even streams whose data already arrived. HTTP/3's QUIC gives each stream independent loss recovery, so one stream's lost packet no longer blocks the others.

## When to use

Most of this is handled automatically by the server, browser, and CDN — there's no version to "choose" per request. What changes is which client-side optimizations still make sense: techniques developed to work around HTTP/1.1's connection limits can be actively counterproductive once HTTP/2 is in play.

## Trade-offs

HTTP/2's single connection means a slow or misbehaving intermediary — a proxy with a low per-connection rate limit, a buggy load balancer — affects every request multiplexed over it, where HTTP/1.1 could route around the problem via its other parallel connections. HTTP/3 needs UDP, which some corporate networks and firewalls block, so clients transparently fall back to HTTP/2 in those environments.

## Pitfalls

**Domain sharding** — splitting assets across multiple subdomains to get more parallel HTTP/1.1 connections — actively hurts under HTTP/2: each new hostname needs its own connection and TLS handshake, and loses the multiplexing benefit of sharing one connection. Similarly, bundling many small files into one large file to reduce request count was an HTTP/1.1-era optimization; under HTTP/2, many small cacheable files that multiplex efficiently can outperform one large file that has to be re-downloaded in full after any change.
