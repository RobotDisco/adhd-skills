# 0027: Retroactive tag sweep — `:career:`, `:adhd:`, `:housekeeping:`, `:productivity:` dropped; `:list:` sanctioned

**Date**: 2026-07-13
**Status**: Accepted

## Context

[[0025]] established two gates a facet tag must clear: **critical mass** (enough notes
to justify navigating by it) and **handling distinction** ("does the tag change what you
actually do with the note?"). It listed `:tulip: :adhd: :career:` together as facets that
had already cleared both.

While tagging notes produced during [[0026]]'s validation work, the question of which
facets were actually still sanctioned came up directly. Checked against the corpus:

| Tag | Notes carrying it |
|---|---|
| `:tulip:` | 173 |
| `:adhd:` | 45 |
| `:career:` | 29 |

Both `:adhd:` and `:career:` clear critical mass comfortably — more than `:project:`
(17) or `:area:` (13), neither of which is in dispute. But re-reading [[0025]] and
`note-quality-criteria.md` turned up no written handling rule for either tag. `:tulip:`
has one: Confluence/Jira is treated as the canonical source, and a `:tulip:` note links
rather than regurgitates. `:career:` and `:adhd:` have nothing comparable — they mark a
topic, not a different way of working with the note. Asked directly, the answer was that
they're "just topic labels" — no handling distinction was ever intended.

That raised the obvious follow-up: what does the *rest* of the tag corpus look like? A
full audit of every `#+FILETAGS:` value in `notes/` (excluding the journal, governed
separately by [[0023]]) turned up more of the same pattern, beyond the already-sanctioned
vocabulary:

| Tag | Count | Note |
|---|---|---|
| `:housekeeping:` | 14 | Near-entirely paired with `:adhd:` — ADHD-informed physical organization notes (piles, inbox, hoarding) |
| `:list:` | 4 | Open, unelaborated collections (creative project ideas, computer annoyances, board games) |
| `:productivity:` | 3 | Generic topic label |
| `:producitivity:` | 1 | Typo of the above |
| `:feeting:` | 1 | Typo of `:fleeting:` — fixed directly, not part of this decision |
| ~45 more, each used 1–5 times | — | `llm`, `coffee`, `social`, `finances`, `emotions`, `linux`, `emacs`, `bible`, `religion`, `mentalhealth`, `lisp`, `gitlab`, `creativity`, `zettelkasten`, and similar — the pre-[[0025]] tagging habit still sitting in the corpus |

Same question for each: real critical mass, or a stated handling distinction, or neither.
`:archive:` also turned up in this audit but is handled separately in [[0028]] — its
justification doesn't fit the mass/distinction test this sweep is otherwise applying.

## Decision

[[0025]] asserted `:career:` and `:adhd:` had cleared both gates without ever
demonstrating the second one. Mass without distinction is exactly the failure mode
[[0025]] itself warns about — a tag "true of every referent" or that "carries no
information however true it is" even when the topic is real. Applying that same test
across the whole corpus:

**Dropped:**
- `:career:`, `:adhd:` — real mass, no handling distinction, just topic labels.
- `:housekeeping:` — same: real mass (14, more than `:area:` or `:project:`), but riding
  along on `:adhd:`, not a distinct handling of its own.
- `:productivity:` / `:producitivity:` — cleared outright. Neither had a stated
  distinction, and the typo variant should never have existed as a separate tag.
- The rest of the long tail — none individually clears critical mass, none has a stated
  distinction. Left alone rather than swept, per the opportunistic-migration precedent
  ([[0019]]); this ADR just formally declines to sanction any of them.

No bulk retagging for any of the above. A facet tag isn't a lifecycle/kind marker, so
dropping it doesn't require reclassifying the note — the fix is just removing the stray
tag, and it happens opportunistically as notes are encountered (Phase B critique, the
weekly random-note encounter, or otherwise), the same discipline already established for
the `:resource:` migration in [[0019]].

**Sanctioned:**
- **`:tulip:`** remains the sole active context/domain facet with a stated handling
  distinction.
- **`:list:`** — the one long-tail tag worth keeping. Handling distinction: an open
  collection you add to and scan over time, with no single triggering task and no claim
  to think through — distinct from `:runbook:` (consulted *when doing a specific task*)
  and from `:fleeting:` (destined for elaboration into a claim). "Creative Project Ideas"
  and "Computer annoyances to fix" are backlogs, not procedures or claims-in-waiting.

Any future proposal for a new facet tag must state its handling distinction explicitly
at proposal time — what you'd concretely do differently because of the tag — not just
project that critical mass will eventually justify it.

## Alternatives considered

**Leave `:career:`/`:adhd:` as-is** — rejected. They fail [[0025]]'s own test; leaving a
mass-but-no-distinction tag standing undermines the test for every facet proposed after
it.

**Write handling rules for the dropped tags now, to retroactively earn their place** —
considered, rejected. There isn't a real distinction to write — the direct answer was
that these are just topic labels. Inventing a workflow to justify a tag after the fact
inverts the gate: the handling distinction is supposed to motivate the tag, not be
manufactured to rescue one already in use.

**Bulk-retag or delete the long tail now** — rejected, same reasoning as the original
`:resource:` migration ([[0019]]): a sweep like this is scope creep dressed as cleanup.
It drains out opportunistically as notes are encountered.

**Fold `:list:` into `:runbook:`** — considered, since `note-quality-criteria.md`
currently allows "a multi-step procedure or reference list" under `:runbook:`. Rejected:
a runbook is findable from the task it serves; these lists have no triggering task, so the
existing runbook criteria (findable-from-task, must-stay-accurate) don't actually fit
them. `:list:` names a genuinely different shape.

## Consequences

- `brain/CLAUDE.md`'s tag table and `note-quality-criteria.md`'s facet/function-axis
  tables are updated to match: `:career:`/`:adhd:` removed, `:list:` added.
- 88 notes (`:adhd:` 45, `:career:` 29, `:housekeeping:` 14) plus the productivity variants
  carry tags that will drain out opportunistically; no bulk migration task is created.
- `:tulip:` and `:list:` are, for now, the only sanctioned facet/collection tags outside
  the core two axes. A new one needs both gates cleared with a stated handling rule, not
  just usage volume.
