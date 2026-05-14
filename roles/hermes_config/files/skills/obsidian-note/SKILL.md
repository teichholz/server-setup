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
4. After all notes for the session are written, run a **vault link pass**:
   a. List existing notes in the vault (e.g. `fdfind -e md . <vault>`).
   b. For each newly written note, identify related existing notes by topic
      overlap and add `[[wikilinks]]` in both directions.
   c. Review filenames — both new notes from this session and existing vault
      notes that were linked or read. Rename a note if:
      - The current name is too broad for its actual content (e.g. `python.md`
        for a note that only covers list comprehensions)
      - A more precise name would make the topic immediately clear
      Never rename toward a broader or more generic title.
      For every rename: update the frontmatter `title` field, then find every
      incoming link with `rg -l "\[\[old-note-name" <vault>` and update every
      occurrence before finishing.

## Pitfalls

- Don't create notes that are just a title with no content
- Check for existing notes on the same topic before writing to avoid duplicates
- When renaming, always run `rg -l "\[\[old-note-name" <vault>` to find every
  file with an incoming link and update them — a broken link is worse than a
  generic filename
- Never rename toward a broader scope; only rename to be more specific

## Verification

Confirm the file exists at the expected vault path, has non-empty content, and
any renamed files have no dangling `[[wikilinks]]` pointing to the old name.
