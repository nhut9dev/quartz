---
title: Appointment
description: A scheduled healthcare interaction between a patient, provider, location, and service.
tags:
  - domains/healthcare
  - healthcare
  - scheduling
---

An **appointment** is a scheduled healthcare interaction.

It usually connects a patient, provider, service, location, time slot, status, and reason for visit. Appointment state matters because scheduled, checked in, completed, cancelled, and no-show appointments have different operational and billing consequences.

Healthcare scheduling must handle provider availability, room capacity, cancellations, rescheduling, reminders, waitlists, and access rules. This often connects to [[../../product-engineering/notification-ux|Notification UX]] and [[../../database/transaction|Transaction]].
