---
name: obsidian-note
description: Write structured Markdown notes to the Obsidian vault
version: 1.0.0
platforms:
  - linux
metadata:
  hermes:
    tags: [obsidian, notes, markdown, knowledge-management]
    category: knowledge
---

## When to Use

When findings or knowledge need to be persisted as a note. Applies to:
- Research task completed and results should be saved
- Explicit requests: "take a note on X", "I want to remember X", "document X"
- Step 2 of the default research → note → cards flow

## Procedure

1. Read `AGENTS.md` in the vault root for folder structure, frontmatter schema, and tagging conventions.
2. Choose an appropriate subdirectory based on topic.
3. Write a structured `.md` file:
   - Filename: kebab-case, descriptive
   - Frontmatter: at minimum `tags` and `date`
   - Body: clear headings, substantive content — not just a title
4. Link to related notes using `[[wikilinks]]` where relevant.

## Pitfalls

- Don't create notes that are just a title with no content
- Check for existing notes on the same topic before writing to avoid duplicates

## Verification

Confirm the file exists at the expected vault path and has non-empty content.
