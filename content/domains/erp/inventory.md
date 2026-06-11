---
title: Inventory
description: The tracking of item quantities, locations, reservations, movements, and availability.
tags:
  - domains/erp
  - erp
  - inventory
---

**Inventory** is the tracking of what items exist, where they are, and whether they are available.

A useful inventory model distinguishes on-hand quantity, available quantity, reserved quantity, damaged stock, in-transit stock, and committed stock. These numbers answer different operational questions and should not be collapsed into one field without care.

Inventory systems are sensitive to concurrency. Sales orders, purchase receipts, warehouse adjustments, returns, and transfers can all change availability. Implementation often needs [[../../database/transaction|transactions]], locking strategy, audit history, and clear correction workflows.
