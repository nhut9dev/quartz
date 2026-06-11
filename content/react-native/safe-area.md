---
title: Safe area
description: Screen space that avoids notches, status bars, and home indicators.
tags:
  - react-native
  - mobile
  - layout
---

The **safe area** is the usable screen space that avoids system UI such as notches, status bars, rounded corners, and home indicators.

Mobile screens are not simple rectangles of fully usable content. UI placed at the very edge can be hidden or hard to tap.

React Native apps commonly use safe-area helpers to add padding around screens, headers, and bottom bars.

Safe area is a [[mobile-platform|mobile platform]] concern, but React Native apps need to handle it because layouts run across many device shapes.
