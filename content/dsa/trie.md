---
title: Trie
description: A prefix tree for storing and searching strings by character path.
tags:
  - dsa
---

A **trie** (prefix tree) stores strings as paths through a tree, where each edge represents a character and shared prefixes share nodes.

Looking up or inserting a word takes time proportional to its length, independent of how many words the trie holds.

Use it for autocomplete, spell checking, prefix matching, and routing, where many strings share common beginnings.

The tradeoff is high memory use, since each node may hold a child pointer per possible character.

It is a specialized [[tree|tree]] and often outperforms a [[hashmap|HashMap]] when you need prefix queries rather than exact-key lookups.
