---
title: Code review process
description: A team-level workflow for reviewing changes before they merge.
tags:
  - engineering-process
  - process
---

A **code review process** is the team-level workflow that governs how changes are examined before they merge.

It defines who reviews, what gets checked, and what gates a change must pass, such as approvals, passing tests, and required checks. Clear rules keep reviews consistent rather than depending on individual mood.

Review latency matters: a soft SLA on turnaround keeps changes flowing, because pull requests that sit for days stall the whole team. Small, focused changes are reviewed faster and more thoroughly than large ones.

The aim is shared ownership and early defect catching, not gatekeeping. Reviews also spread context, which doubles as lightweight [[engineering-onboarding|onboarding]].

A good process pairs automated gates with human judgment and ties cleanly into the team's [[../scrum/definition-of-done|Definition of Done]].
