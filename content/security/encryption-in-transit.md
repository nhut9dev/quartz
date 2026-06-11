---
title: Encryption in transit
description: Protecting data on the wire with TLS while it moves between systems.
tags:
  - security
---

**Encryption in transit** protects data while it moves across a network, so an eavesdropper sees only ciphertext.

On the web this is provided by [[../web/tls|TLS]], the protocol behind HTTPS.

It defends against passive sniffing and active tampering by attackers on the network path.

It says nothing about how data is stored once it arrives, which is the role of [[encryption-at-rest|encryption at rest]].

Modern systems encrypt internal service-to-service traffic too, not just the public-facing edge.
