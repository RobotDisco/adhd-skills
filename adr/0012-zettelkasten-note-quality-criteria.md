# 0012: Zettelkasten note quality criteria — the bar a note must clear

**Date**: 2026-06-21
**Status**: Accepted

## Context

The brain repo holds ~2,500 notes, the majority still `:fleeting:` or unprocessed
`:literature:`. Without a clear, testable bar for what makes a note "done," two failure
modes recur: notes accumulate as clutter that is never elaborated, and elaboration that
does happen stalls at faithful summary instead of reaching the writer's own claim.

`brain/CLAUDE.md` lists four criteria (atomic subject, self-retrieving title, at least one
link, lifecycle tag) but the rationale was never written — it pointed at a nonexistent
ADR. This ADR is that rationale, and it expands the list to make the most-often-missed
requirement explicit.

The deeper observation behind it: the bottleneck is almost never structure (titles, tags,
links — these come easily). It is the **comprehension→integration step** — moving from
"what the source said" to "the claim I now hold." That step is the actual cognitive work a
zettelkasten exists to produce, and it is the one most easily skipped.

## Decision

### The bar — a note earns a place only if it clears all seven

1. **Atomic** — one idea. If the note needs "and" to describe it, it is two notes.
2. **Self-retrieving title** — a claim, not a topic label. You must recognise it as
   relevant when searching months later.
3. **At least one link** — ideally motivated by the ramification (#7). Zero links =
   functionally does not exist.
4. **Lifecycle tag** — one of the active FILETAGS.
5. **In your own words, standalone** — understandable without the source or the
   conversation that produced it. This is the integration act; a paraphrase or paste does
   not satisfy it.
6. **A claim** — it asserts something, not merely names a subject.
7. **Ramification** — the "so what." May live in the body *or* be carried by the links
   (a claim whose consequences are linked notes). A claim with neither stated consequence
   nor consequential link is an assertion floating in space.

Criteria 1–4 are *structure*; 5–7 are *thinking*. The thinking criteria are the ones that
get deferred and the ones that matter most. When a note feels stuck, assume the gap is at
5–7, not the structure.

### Atomicity is about linkability, not size

The right grain is the one that lets you link to exactly the idea you mean, no more. The
test is not word count — it is: *will I ever want to link to this idea without the others
around it?* If yes, it is its own atom. (Same "not size" logic as project granularity in
[[0008]] — knowledge/connection value, not count, decides what earns its own node.)

### When notes cluster: hub-and-spokes, not collapse

Several specific claims that together support one general claim should be kept as separate
atoms with a **structure note** over them — not collapsed into a single note. Collapsing
reduces linkability: you can no longer point at one claim without dragging in the rest.

The deciding question — **the link test**: *would I ever link to one of these without the
other two?* Yes → keep them separate, add a structure note. No → they were one note all
along; a single structure note with a comparison table is honest.

### Structure notes are `:permanent:` plus a function — not a new tag

"Permanent" is a *lifecycle/maturity* answer; "structure note" is a *function* (hub vs.
atomic claim). A structure note is a permanent note that happens to function as a hub, so
it is tagged `:permanent:`. Do **not** create a `:structure:`/`:moc:` tag — its function is
carried by its content (claim-title + link-dense table/list) and surfaced by org-roam
backlinks. Revisit only if hub notes reach a critical mass with a genuine "show me all my
maps of content" retrieval need.

### Prefer links to taxonomy; tags earn their place at critical mass

Following Matuschak: prefer associative links to hierarchical tags. A link carries the
*relationship* ("X implies Y"); a tag only carries set membership. A topic tag that will
only ever sit on a handful of notes (`:plan9:`, `:nix:`, `:git:` — the singleton tail in
the current vocabulary) adds no discoverability a single link would not. Do not pre-create
a tag for an anticipated future. A topic earns a tag — or better, a structure note — once
it reaches the mass where you actually need to navigate it (cf. `:coffee:` at ~9, the one
that earned it). The active FILETAGS are lifecycle/faceted, not subject taxonomy; keep them
that way.

### The comprehension→integration boundary

`:literature:` notes render the source faithfully, in your words (comprehension —
Adler's "state the unity"). `:permanent:` notes are your own claim, integrated with the
rest of the graph (integration — the remix/ideation step). The "rewrite in your own words"
move *is* this boundary. A note that stops at faithful summary is a literature note, not a
permanent one, regardless of how it is tagged.

## Alternatives considered

**Keep the four-criteria list (brain/CLAUDE.md as-is)** — superseded, not rejected. The
four are correct but silent on the requirement most often skipped: "in your own words,
standalone" (#3) and the ramification (#5). CLAUDE.md should adopt the seven and reference
this ADR.

**A `:structure:` or `:moc:` tag** — rejected. Premature taxonomy for a category of one;
function is carried by content and backlinks. Reconsider only at demonstrated critical
mass.

**Collapse related claims into one comprehensive note** — rejected as the default. It reads
tidier but destroys link precision. Hub-and-spokes preserves both atomicity and the
synthesis.

## Consequences

- `brain/CLAUDE.md` should: (a) adopt the seven criteria in its "Note quality criteria"
  section, and (b) fix the dangling reference — it currently cites
  `0019-zettelkasten-note-quality-criteria.md`; the correct path is this file (`0012`).
- This ADR is the canonical rationale for the `:resource:` → `:runbook:`/`:permanent:`
  migration (procedural → runbook, has-a-claim → permanent; the "think vs. do" test).
- If a "promote/elaborate a fleeting note" skill is ever built, it should implement this
  seven-point bar as its scoring rubric, and explicitly probe criteria 5–7 rather than
  drafting them for the user — the integration must be the writer's own.
