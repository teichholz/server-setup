---
name: anki-cards
description: Create and sync Anki flashcards using the anki-ai CLI
version: 1.0.0
platforms:
  - linux
metadata:
  hermes:
    tags: [anki, flashcards, spaced-repetition, knowledge]
    category: knowledge
---

## When to Use

After researching a topic or capturing a note, distill key facts into Anki flashcards. Applies to:
- Completing research that produced durable facts worth memorizing
- Explicit requests: "make Anki cards", "add to Anki", "I want to memorize X"
- Step 3 of the default research → note → cards flow

## Procedure

1. Run `anki-ai skill` once at the start of a session to load full CLI docs.
2. If freshness matters, sync first: `anki-ai sync`
3. Before any bulk add/update/delete session, snapshot: `anki-ai snapshot`
4. Create cards:
   - Prefer **Cloze** cards for facts embedded in context
   - Use **Basic** cards for isolated Q/A pairs
   - Tag each card with topic and source type (e.g. `research`, `book`, `video`)
5. Sync after every write session: `anki-ai sync`

## Deck

Create a deck that reflects the topic being studied, but it must be nested under **Brain** (e.g. `Brain::History::Roman Empire`). Never place cards at the top level or outside the Brain hierarchy.

## Pitfalls

- Never run interactive commands — use env vars `ANKI_EMAIL`/`ANKI_PASSWORD` or the pre-configured auth at `~/.config/anki-ai/auth.json`
- Use `--yes` on all destructive commands (delete, restore)
- Don't create cards for trivia or things the user clearly already knows
- If the right deck is unclear, default to **Brain** rather than asking

## Verification

Confirm sync completed without errors. Report the number of cards added/updated.
