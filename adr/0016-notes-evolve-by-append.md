# 0016: Notes evolve by append, not rewrite — preserve prior thinking, link to updates

**Date**: 2026-06-21
**Status**: Accepted

## Context

A digital zettelkasten (org-roam) makes notes freely editable — unlike Luhmann's paper
cards, where ink fixed a card's content and new thinking could only arrive as new cards on
branching numbers. So a question that paper answered by default now has to be decided: when
*later* thinking changes, resolves, or contradicts an *earlier* note's claim, what do you
do to the earlier note?

Three temptations present themselves, and the question recurs every time the graph produces
a synthesis (it surfaced while resolving a self-advocacy tension into its own resolution
note): rewrite the old note to match the new conclusion; leave the old note untouched even
though it now asserts something false; or treat notes as strictly immutable à la Luhmann.

There is also a folk version of Luhmann's "never change a card" that gets cargo-culted as a
law of knowledge management. Part of it is real; part of it is a paper-medium artifact. The
decision needs to separate the two.

## Decision

Notes evolve by **append, not rewrite**.

When later thinking changes an existing note's status, **preserve the original text** and add
a marked, dated annotation that links to the new note:

```
[Update YYYY-MM-DD: resolved — see [[id:...][title of the new note]]]
```

Never overwrite the original claim. The prior thinking — including tension, confusion, or
being wrong — is itself part of the record, and the *arc of changing your mind* is valuable
content, often more valuable than either endpoint alone.

This is the **correct** reading of Luhmann's immutability, not a rejection of it. His
principle is "don't destroy the record," not "never touch a note." Paper enforced that by
making edits physically hard; digitally, *append* preserves the same value — an intact
record plus a visible evolution — without the paper constraint and without leaving the note
asserting something false. The link graph carrying the evolution (old claim → its later
update → the new atom) is exactly what Luhmann's branching numbers and links were *for*.

### When to add an explicit inline update vs. trust org-roam backlinks

org-roam's backlink buffer already solves **discoverability** automatically: if the new note
links to the old one, the old note's backlink panel shows it. So **do not manually mirror
links** in general — reverse-linking everything is redundant double-maintenance and defeats
the point of backlinks.

Add an explicit inline update *only* when it does something the undirected backlink cannot:

- **Corrects a now-false assertion** in the note's own *text* (a backlink shows a referrer;
  it does not fix what the note says it concluded). This is about standalone-accuracy
  (cf. [[0012]] criterion 5).
- **Names the relationship** — "resolved by", "superseded by", "complicated by" — which a
  bare backlink ("something links here") cannot express.

## Alternatives considered

**Rewrite the old note in place** — rejected. Destroys the record of what you thought then;
erases the tension/struggle that is itself data.

**Leave the old note stale** — rejected. The note then asserts something false in its own
text (e.g. "I don't know how to resolve this" after you have). A reader of the prose, not
the backlink panel, reaches a wrong conclusion — it fails standalone-accuracy ([[0012]] #5).

**Strict Luhmann immutability (never touch a note)** — rejected as over-applied. It is
partly a paper artifact, and on its own it leaves the staleness problem unsolved. Append
preserves the same value (the record) while fixing staleness.

**Manually mirror every link with a reverse link** — rejected. org-roam backlinks handle
reverse-discoverability; mirror only to correct text or name a relationship (above).

## Consequences

- The atomic unit of revision is the **append**, not the edit. Updates are marked and dated
  so the arc is legible.
- Relates to [[0012]]: a stale note fails criterion 5 (standalone, understandable); the
  append is how you fix that without destroying history.
- Distinct from [[0015]]: the *journal* is a one-way fleeting husk that is not revised at all
  (value is extracted out of it, not appended back in). This ADR governs the *permanent
  graph*, where notes are long-lived and do get revisited.
- `brain/CLAUDE.md` can reference this where it discusses note lifecycle/quality.
