---
title: Patient record
description: A healthcare record that stores patient identity, clinical history, encounters, observations, and care-related data.
tags:
  - domains/healthcare
  - healthcare
  - patient-data
---

A **patient record** stores patient identity and care-related history.

It may include demographics, allergies, diagnoses, encounters, medications, lab results, care plans, notes, and documents. Different users may need different views of the same patient depending on role, care relationship, and legal policy.

Engineering concerns include identity matching, data provenance, partial corrections, access control, audit history, and retention rules. Patient records should connect to [[healthcare-privacy|Healthcare privacy]] and [[../../security/principle-of-least-privilege|Principle of least privilege]].
