---
title: On-call
description: The rotating responsibility for responding to production issues.
tags:
  - engineering-process
  - reliability
---

**On-call** is the rotating responsibility for responding to production problems outside of normal feature work.

The engineer on call owns triage and first response when alerts fire, escalating to specialists only when needed. Rotations spread this load so no one person carries it permanently.

A clean handoff between shifts is where on-call succeeds or fails: open issues, recent changes, and known risks must transfer with the pager, not live in one person's head.

A sustainable rotation also limits alert noise, because constant interruptions burn people out and erode response quality.

On-call work flows into [[../sre/incident-response|incident response]], leans on [[../observability/runbook|runbooks]] for fast recovery, and depends on clear [[incident-communication|incident communication]].
