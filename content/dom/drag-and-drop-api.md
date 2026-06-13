---
title: Drag and Drop API
description: Native browser APIs for dragging elements and files and dropping them onto targets.
tags:
  - dom
  - browser
---

The **Drag and Drop API** lets users drag elements — or files from outside the browser — and drop them onto designated targets, via a sequence of drag events and a `DataTransfer` object that carries the dragged data.

## How it works

A draggable element (`draggable="true"`) fires `dragstart`, where the handler sets data on `event.dataTransfer` via `setData(type, value)` and optionally a custom drag image. As the dragged item moves over potential drop targets, each fires `dragover` repeatedly — the target must call `event.preventDefault()` on `dragover`, or the browser's default (reject the drop) wins. On release, the target's `drop` handler reads `event.dataTransfer.getData(type)` (or `.files` for OS file drops), and `dragend` fires on the source element regardless of outcome.

## When to use

Use it for reordering lists, drag-to-upload file zones, or drag-between-containers UIs like kanban boards. For reordering without native drag visuals, a pointer-events-based implementation (tracking `pointermove`) sometimes gives more control over animation — but native drag-and-drop gets OS-level file drops "for free" and works across browser tabs and windows.

## Trade-offs

The native API integrates with OS-level drag sources — dragging a file from the desktop — and gives free cross-window dragging, but its event model is awkward: `dragover` must call `preventDefault()` on every target to allow dropping, drag-image customization is limited, and there's no built-in drop indicator — all visual feedback during a drag is manual.

## Pitfalls

Forgetting `event.preventDefault()` in `dragover` (and often `dragenter`) means `drop` never fires — the most common "drag and drop doesn't work" bug. Touch devices don't support the native HTML5 drag-and-drop API at all, so a mobile-compatible implementation needs a separate touch/pointer-based fallback, or a library like dnd-kit that abstracts both. And `dataTransfer.getData()` only reliably works inside the `drop` handler for data set during the same drag's `dragstart` — most browsers block reading it during `dragover`, which trips up attempts to preview dragged content before drop.
