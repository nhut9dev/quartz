---
title: TLS handshake
description: How a client and server negotiate keys and identity before encrypting traffic.
tags:
  - networking
---

**The TLS handshake** is the negotiation a client and server perform before exchanging encrypted data, agreeing on keys, a cipher, and verifying identity.

The client offers supported versions and ciphers; the server picks one and presents its certificate.

The client validates that certificate against a trusted authority, then both sides derive a shared session key using public-key cryptography.

Once the key is established, all further traffic is encrypted, which is what makes [[../web/tls|TLS]] and HTTPS secure.

It matters because it provides both confidentiality and authentication of the server before any sensitive data is sent.

The tradeoff is latency: the handshake adds round trips, which newer versions like TLS 1.3 and [[http3-quic|QUIC]] work to reduce.
