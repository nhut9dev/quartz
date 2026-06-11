---
title: Incident response
description: The process for detecting, coordinating, mitigating, and communicating during production incidents.
tags:
  - sre
  - reliability
---

**Incident response** is the process for handling production failures in a coordinated way.

The goal is to reduce impact quickly, keep communication clear, and capture enough context to learn afterward.

Common roles include incident commander, communications lead, and technical responders. The process usually includes triage, mitigation, monitoring, user communication, and handoff to a [[postmortem|postmortem]].

Good incident response depends on [[../observability/alerting|alerting]], [[../observability/runbook|runbooks]], dashboards, and safe rollback paths.
