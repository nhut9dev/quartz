---
title: Incident communication
description: Sharing clear, timely status updates with stakeholders during an incident.
tags:
  - engineering-process
  - reliability
---

**Incident communication** is the practice of giving clear, timely updates to stakeholders while an incident is ongoing.

The goal is to keep affected teams and users informed about impact, current status, and next update time, even when the root cause is still unknown. Saying "we are investigating, next update in 30 minutes" beats silence.

Separating the communicator role from the responders keeps engineers focused on the fix while someone else manages the audience. Updates should describe user-visible impact, not internal jargon.

Honest, frequent updates protect trust; vague or absent ones amplify the damage of the outage itself.

It is a core part of [[../sre/incident-response|incident response]] and [[engineering-process/on-call|on-call]], and the record it produces feeds the [[../sre/postmortem|postmortem]].
