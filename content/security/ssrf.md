---
title: SSRF
description: Server-side request forgery, where a server is tricked into making unintended requests.
tags:
  - security
---

**SSRF** stands for server-side request forgery.

An attacker supplies a URL that the server then fetches, tricking it into reaching internal or otherwise unreachable resources.

A classic target is a cloud metadata endpoint, which can leak credentials to the attacker.

SSRF is dangerous because the request comes from inside the network, often bypassing firewalls and IP allowlists.

Defenses include validating and allowlisting destinations, blocking internal address ranges, and following the [[principle-of-least-privilege|principle of least privilege]] for the service making the request.
