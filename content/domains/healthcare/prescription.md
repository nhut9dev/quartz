---
title: Prescription
description: A clinical order that authorizes a patient to receive a medication with specific dosage and usage instructions.
tags:
  - domains/healthcare
  - healthcare
  - medication
---

A **prescription** is a clinical order for medication.

It usually includes patient, prescriber, medication, dosage, route, frequency, duration, refills, pharmacy, and safety notes. Prescriptions can be new, changed, cancelled, expired, filled, partially filled, or denied.

Engineering risks include ambiguous medication names, unsafe defaults, duplicate prescriptions, missing allergy checks, and weak audit history. Prescription workflows need stronger validation than ordinary form submission.
