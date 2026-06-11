---
title: PKCE
description: An OAuth protection that makes authorization codes harder to steal and replay.
tags:
  - security
  - auth
---

**PKCE** stands for Proof Key for Code Exchange.

It protects an [[../web/oauth|OAuth 2.0]] authorization code by binding it to a secret created by the client before the login redirect starts.

The client sends a code challenge first, then later proves it has the original code verifier when exchanging the authorization code for tokens.

PKCE is especially important for browser and mobile apps because they cannot safely store a long-lived client secret.
