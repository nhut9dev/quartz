---
title: Security
description: An index of application security notes for web and backend development.
tags:
  - security
  - index
---

Security work reduces how much damage bugs, bad inputs, leaked credentials, and hostile traffic can cause.

These notes focus on practical concepts that appear in everyday web applications.

## Authentication and secrets

- [[password-hashing|Password hashing]]
- [[refresh-token|Refresh token]]
- [[secure-cookie|Secure cookie]]
- [[pkce|PKCE]]
- [[session-fixation|Session fixation]]
- [[jwt-pitfalls|JWT pitfalls]]
- [[security/secret-rotation|Secret rotation]]

## Application security

- [[input-validation|Input validation]]
- [[dependency-security|Dependency security]]
- [[security-headers|Security headers]]
- [[clickjacking|Clickjacking]]
- [[supply-chain-attack|Supply chain attack]]
- [[principle-of-least-privilege|Principle of least privilege]]
- [[threat-modeling|Threat modeling]]
- [[owasp-top-10|OWASP Top 10]]
- [[audit-log|Audit log]]

## Attacks and hardening

- [[sql-injection|SQL injection]]
- [[command-injection|Command injection]]
- [[ssrf|SSRF]]
- [[replay-attack|Replay attack]]
- [[cors-misconfiguration|CORS misconfiguration]]
- [[brute-force-protection|Brute-force protection]]

## Cryptography

- [[encryption-at-rest|Encryption at rest]]
- [[encryption-in-transit|Encryption in transit]]

Related web security notes: [[../web/csrf|CSRF]], [[../web/xss|XSS]], [[../web/content-security-policy|Content Security Policy]], [[../web/cors|CORS]], and [[../web/same-origin-policy|Same-origin policy]].
