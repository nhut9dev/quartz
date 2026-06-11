---
title: Brute-force protection
description: Defending login and credential endpoints against automated password-guessing attacks.
tags:
  - security
  - auth
---

**Brute-force protection** limits how often an attacker can guess credentials against a login or token endpoint.

## How it works

Track attempts per IP *and* per account, then throttle once a threshold is crossed. Exponential delays slow each successive failed try, CAPTCHA gates suspicious sessions, and account lockout temporarily freezes an identity after repeated failures. None of this works without strong [[password-hashing|password hashing]], so an offline leak of the store stays expensive to crack.

## Pitfalls

Account lockout is a denial-of-service vector: an attacker who knows a username can lock a victim out at will. Prefer escalating delays and CAPTCHA over hard locks. Per-IP limits alone miss **credential stuffing**, where bots replay username/password pairs from prior breaches, and **distributed attempts** spread across thousands of IPs each stay under the limit. Defend these by scoring per-account velocity, checking passwords against known-breach lists, and watching for many accounts failing from one fingerprint.

## When to use

Apply to every authentication surface: login, password reset, token refresh, and API key checks. Pair with [[../auth/mfa|MFA]] so a guessed password alone is not enough, and lean on [[../api-design/rate-limit-design|rate limit design]] for the throttling layer.
