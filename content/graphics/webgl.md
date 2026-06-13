---
title: WebGL
description: A JavaScript API for GPU-accelerated 2D and 3D rendering.
tags:
  - graphics
  - browser
---

**WebGL** is a JavaScript API for rendering 2D and 3D graphics on the GPU, modeled closely on OpenGL ES.

## How it works

Unlike [[canvas-api|Canvas 2D's]] CPU-driven immediate-mode drawing, WebGL compiles small programs — vertex and fragment shaders, written in GLSL — that run directly on the GPU in parallel across many vertices and pixels at once. The JavaScript side mostly uploads data (geometry, textures) into GPU buffers and issues draw calls; the actual per-pixel computation happens in the shaders.

## When to use

Reach for WebGL — usually via a higher-level library like Three.js or PixiJS rather than raw calls — for 3D scenes, GPU-accelerated visual effects, or 2D rendering with very high element counts (thousands of moving sprites) where Canvas 2D's CPU-bound drawing becomes the bottleneck. For typical UI graphics, [[svg|SVG]] or Canvas 2D is simpler and sufficient.

## Trade-offs

Moving work to the GPU unlocks performance that's out of reach for CPU-bound Canvas 2D — but the raw API is low-level: manual buffer management, shader compilation, and matrix math, which is why most teams build on a library rather than writing WebGL directly.

## Pitfalls

WebGL context loss — the browser can reclaim the GPU context under memory pressure or after a tab sits backgrounded for a long time — silently invalidates all buffers and textures, and an app that doesn't listen for `webglcontextlost`/`webglcontextrestored` just shows a blank canvas afterward. Mobile GPUs vary widely in capability (texture size limits, shader precision), so a scene that renders correctly on desktop can fail or look wrong on lower-end phones.
