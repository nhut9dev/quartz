---
title: Encryption at rest
description: Encrypting stored data so a disk or database leak does not expose plaintext.
tags:
  - security
---

**Encryption at rest** protects stored data by keeping it encrypted on disk, so a stolen drive or leaked backup reveals only ciphertext.

It guards against physical theft, misplaced backups, and direct access to storage media.

It does not protect data while an application is actively using it, which is the job of [[encryption-in-transit|encryption in transit]] and access controls.

Key management is the hard part: if the keys live next to the data, encryption adds little.

It pairs with [[principle-of-least-privilege|least privilege]] so that few systems can decrypt at all.
