---
name: anki-review
description: Identify struggling Anki cards and enrich their source Obsidian notes
version: 1.0.0
platforms:
  - linux
metadata:
  hermes:
    tags: [anki, obsidian, spaced-repetition, knowledge, review]
    category: knowledge
---

## When to Use

When the user signals difficulty retaining material or explicitly asks to
strengthen weak notes. Applies to:
- "I keep failing X", "strengthen my weak cards", "review struggling cards"
- After a review session the user reports was difficult
- "Enrich notes for hard cards"

Do NOT trigger automatically during the normal research → note → cards flow.

## Procedure

1. Snapshot first: `anki-ai snapshot`

2. Query struggling cards using Anki search syntax (returns JSON with `ease_pct`,
   `lapses`, `interval_days`, `reviews`):
   ```
   anki-ai cards list "prop:lapses>=3"
   anki-ai cards list "prop:ease<200"
   ```
   Merge and deduplicate results by `note_id`. Skip cards with `reviews < 3` —
   too few reviews to distinguish genuinely hard from just-unseen.

3. For each struggling note_id, fetch full content:
   ```
   anki-ai notes get <note_id>
   ```
   This returns Front, Back, Tags, and Extra fields.

4. Resolve the source Obsidian note:
   - **Primary**: if Extra contains `Source: [[Note Name]]`, search the vault
     directly: `fd "Note Name.md" ~/vaults/brain/`
   - **Fallback**: extract 2–3 keywords from the card Front and search:
     `rg -l "<keyword>" ~/vaults/brain/`
   - If no note can be found after both attempts, record it as unresolvable
     and skip.

5. Diagnose why the card is likely failing. Look for:
   - Concept explained only abstractly, no concrete example
   - No analogy to a familiar concept
   - No counterexample or failure mode
   - No memorable hook (acronym, story, image description)

6. Enrich the note — add to or expand the weak section:
   - Add a concrete example with real numbers, names, or code
   - Add an analogy to something the user likely knows
   - Add a counterexample or failure mode under `## Trade-offs / Gotchas`
   - Add a one-sentence mnemonic if one exists naturally
   Do NOT rewrite the note's structure or replace existing content —
   only add to weak sections.

7. Update `modified: YYYY-MM-DD` in frontmatter to today.

8. If the card's Back field can be meaningfully improved to reflect the
   enrichment (e.g. a crisper formulation, an added example), update it:
   ```
   anki-ai notes update <note_id> --field Back "<improved back>"
   ```
   Keep Front unchanged — changing the question breaks muscle memory.

9. Sync: `anki-ai sync`

## Thresholds

| Condition | Action |
|-----------|--------|
| `prop:lapses>=3` | Enrich source note unconditionally |
| `prop:ease<200` | Enrich if no example section exists in source note |
| `reviews<3` | Skip — not enough data |

## Pitfalls

- Never run interactive commands — use pre-configured auth at
  `~/.config/anki-ai/auth.json`
- Don't create new Anki cards during this skill — that is the `anki-cards`
  skill's job
- Don't rewrite entire notes — add to weak sections only
- If Extra lacks a `Source:` link, use the keyword fallback but note that
  provenance is missing — mention it in the final report

## Verification

Report:
- Cards analysed (total, by threshold hit)
- Notes enriched (with vault paths)
- Cards whose Back was updated
- Unresolvable cards (no source note found)
