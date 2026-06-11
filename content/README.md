---
title: Content Authoring Guide
draft: true
---

How to write notes in `content/` for this Quartz v5 site. This file is `draft: true` so it **won't** be published — every other `.md` file in `content/` **is published by default**.

## 1. Folders & naming

- `content/index.md` → the **home page** (required).
- Every folder (including nested ones) auto-generates a **folder page** listing the notes inside; give each one a `<folder>/index.md`.
- **File/folder name** (filesystem) → **URL slug**: `notes/linux.md` → `/notes/linux`. Use kebab-case, no accents.
- **Folder display name** (explorer, breadcrumbs, folder page) = the `title` in `<folder>/index.md`. E.g. `cli/index.md` with `title: CLI Reference` makes folder `cli` show as "CLI Reference". Missing → falls back to `Folder: <name>`.
- Link to a folder listing: `[[notes/]]` (trailing `/`) · link to a tag listing: `[[tags/linux]]` · `/tags` lists every tag.

> [!warning]
> Don't write a `# Title` at the top of the body — the `article-title` plugin renders `title` as the H1 automatically, so adding one **duplicates the title**. Start with prose or a `## Section`.

## 2. Frontmatter

Metadata block at the top of the file, between `---`:

```md
---
title: Page Title
description: Short description for previews/SEO
tags:
  - linux
  - notes/devops
---

Your note content starts here...
```

**16 core fields** (per `docs/plugins/Frontmatter.md`; multiple keys = aliases, the first matching key wins):

| Field          | Key                                               | Meaning                                              |
| -------------- | ------------------------------------------------- | ---------------------------------------------------- |
| Title          | `title`                                           | Page title; falls back to filename if empty.         |
| Description    | `description`                                     | Description for metadata & search.                   |
| Tags           | `tags`, `tag`                                     | Categorization; lowercased, supports nested `notes/devops`. |
| Aliases        | `aliases`, `alias`                                | Alternative names, used for link resolution.         |
| Permalink      | `permalink`                                       | Fixed URL slug; also added to aliases.               |
| Social image   | `socialImage`, `image`, `cover`                   | Image for social share previews.                     |
| Social desc    | `socialDescription`                               | Description specific to social previews.             |
| Created date   | `created`, `date`                                 | When the note was created.                           |
| Modified date  | `modified`, `lastmod`, `updated`, `last-modified` | When last modified; falls back to `created`.         |
| Published date | `published`, `publishDate`, `date`                | When the note was published.                         |
| Publish        | `publish`                                         | ⚠️ No effect here (`explicit-publish` is off).       |
| Draft          | `draft`                                           | `true` → not published.                              |
| Comments       | `comments`                                        | ⚠️ No effect here (`comments` plugin is off).        |
| Language       | `lang`                                            | Language code.                                       |
| Enable TOC     | `enableToc`                                       | `false` to hide the TOC on that page.                |
| CSS classes    | `cssclasses`, `cssclass`                          | CSS classes applied to the body.                     |

**Extra fields from enabled v5 plugins** (visibility/security — see §3): `unlisted`, `password`, `stealth`.

> [!info] Dates
> Priority is **frontmatter → git → filesystem**. If `created`/`modified` aren't set, Quartz uses **git** history → commit regularly for accurate dates.

## 3. Publishing & hiding pages

By default **every note is published** (`explicit-publish` is off). Ways to hide one:

| Method                                          | Effect                                                                            |
| ----------------------------------------------- | --------------------------------------------------------------------------------- |
| `draft: true`                                   | Removed from the build entirely.                                                  |
| `unlisted: true`                                | Still published & reachable by URL, but hidden from explorer/graph/search/RSS/sitemap/backlinks. |
| `password: <password>`                          | Content encrypted (AES-256), needs the password to read. Add `unlisted: true` to also hide from listings. |
| `stealth: true`                                 | Encrypted page hidden permanently, reachable only by direct URL.                  |
| Put under `private/`, `templates/`, `.obsidian/` | Skipped entirely (`ignorePatterns`).                                              |

> [!danger] Security
> `draft`/`ignorePatterns` only hide the **markdown page**. **Non-markdown files (images, PDFs, recordings...) are STILL emitted publicly** even if the note referencing them is a draft → don't keep sensitive files in `content/`; if the content repo is public, add a matching `.gitignore`.
> `password` is client-side encryption for a static site: it stops casual browsing, **not** a determined attacker. Never commit passwords to a public repo.

## 4. Links & embeds

```md
[[note-name]]                 → link (resolved by shortest path)
[[note-name|display text]]    → link with custom text
[[note-name#heading]]         → link to a heading
[[note-name#^block-id]]       → link to a block

![[image.png]]                → embed an image
![[image.png|100x145]]        → embed an image at 100×145 px (width×height)
![[note-name]]                → transclude another note
![[note-name#heading]]        → transclude one section
```

Just the note name is enough (no full path) as long as it's unique. Inside tables, escape the wikilink `|`: `[[note\|alias]]`.

## 5. Markdown syntax

### Callouts

```md
> [!note] Optional title
> Body.

> [!warning]- Collapsed by default (`+` to expand)
> Hidden body.
```

Types: `note`, `tip`, `info`, `todo`, `abstract`, `question`, `success`, `warning`, `failure`, `danger`, `bug`, `example`, `quote`. `-` after `]` collapses, `+` expands.

### Highlight · comment · checkbox

```md
==highlighted text==
%% comment, not shown on the site %%

- [ ] todo
- [x] done
```

`enableCheckbox` is on → extra task chars: `- [?]` `- [!]` `- [>]` `- [/]` `- [-]`.

### GitHub Flavored Markdown

Tables, footnotes (`[^1]`), `~~strikethrough~~`, task lists, autolinks.

> [!note]
> **SmartyPants** is on: it converts straight `"` → curly `" "`, `--` → en-dash, `---` → em-dash, `...` → `…`. To keep raw characters, wrap them in `` ` ``. Headings also get a "#" link on hover.

### Mermaid & media

```md
![](https://youtu.be/xxxx)    → embed YouTube
![](video.mp4)                → embed a local video
```

Mermaid: a `mermaid` code block (`graph TD ...`) renders as a diagram.

### LaTeX (KaTeX)

```md
Inline: $E = mc^2$

Block ($$ must be on their own lines):
$$
\int_a^b f(x)\,dx
$$
```

Multiple `$` in one paragraph (e.g. prices) → escape `\$`: `I have \$1`.

### Code blocks

Build-time highlighting (Shiki, theme `github-light`/`github-dark`), with a copy button.

````md
```python title="example.py"  ← file title
```js {1-3,6}                  ← highlight lines 1–3 and 6
```js /useState/               ← highlight matches of "useState"
```ts showLineNumbers{20}      ← line numbers starting at 20
````

Inline highlight: `` `[1, 2, 3]{:js}` ``. To show a fence inside a fence, wrap it with one more backtick.

## 6. Tags & table of contents

- Tags: in frontmatter or inline `#tag`; nested `#notes/linux` (a page per level). Purely numeric tags like `#123` are ignored.
- Title/description for a tag page: create `tags/<tag>.md` with `title`/`description` frontmatter.
- **TOC**: built from H1→H3 headings, shown only when there's >1 heading. Hide with `enableToc: false`.

## 7. Special files

- **Canvas** (`.canvas`) — Obsidian JSON Canvas → a pannable/zoomable canvas page.
- **Bases** (`.base`) — Obsidian Bases → database-like views (table/list/card/gallery/board).

## 8. Build & conventions

```bash
npx quartz build --serve     # preview at http://localhost:8080
```

1. Give each note a `title` + `tags`.
2. Link notes with `[[wikilinks]]` to leverage the graph & backlinks.
3. Unfinished note → `draft: true`, remove it when ready.
4. Keep images/attachments in one folder (e.g. `attachments/`), embed with `![[...]]`.
5. Commit regularly so the `modified` date stays accurate.
