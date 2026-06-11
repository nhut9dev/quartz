---
title: TLS
description: The protocol behind HTTPS that encrypts traffic and authenticates the server with certificates.
tags:
  - web
  - security
---

**TLS** (Transport Layer Security) is the protocol that turns plain [[http|HTTP]] into HTTPS. It does two things: it encrypts traffic so intermediaries cannot read or tamper with it, and it authenticates the server so the client knows it is talking to the real host, not an impostor.

## The handshake

The server presents a certificate signed by a trusted certificate authority, binding its public key to its domain; the browser verifies that chain before trusting the connection. The two sides then exchange keys to derive a shared *session key*, and switch to fast symmetric encryption for the rest of the conversation. So asymmetric crypto authenticates and bootstraps; symmetric crypto carries the bulk traffic.

## Performance

The handshake costs round trips, but TLS 1.3 brings it down to one (and 0-RTT for resumed sessions), and session resumption avoids repeating the full exchange. HTTPS is now the default expectation — required for service workers, HTTP/2 and HTTP/3, and most modern browser APIs.

## Pitfalls

The most common production failures are an expired certificate or an incomplete chain (the server forgot to send an intermediate cert). **Mixed content** — an HTTPS page loading HTTP assets — gets blocked. And terminating TLS at a load balancer or [[reverse-proxy|reverse proxy]] means the hop behind it is plaintext unless you re-encrypt, which matters inside untrusted networks. `HSTS` tells browsers to refuse the plaintext fallback entirely.
