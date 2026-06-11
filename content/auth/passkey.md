---
title: Passkey
description: Passwordless login using WebAuthn public-key credentials bound to a device.
tags:
  - auth
---

**A passkey** is a passwordless credential based on public-key cryptography, built on the WebAuthn and FIDO2 standards.

The device holds a private key and the server stores only the matching public key, so there is no shared secret to steal.

Login works by the device signing a challenge, often unlocked with a fingerprint, face, or PIN.

Because nothing reusable is sent to the server, passkeys are resistant to phishing and database leaks.

They are a strong alternative to passwords and to bolt-on [[mfa|MFA]], since the factor is built in.
