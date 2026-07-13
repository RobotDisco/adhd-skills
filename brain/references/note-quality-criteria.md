# Note quality criteria — the bar and how to apply it

Shared reference for any skill that assesses org-roam notes in the brain repo
(`~/Documents/brain`). Read this in full before assessing a note — do not rely on
`brain/CLAUDE.md` being loaded ambiently; it only loads when the working directory is
inside that repo's tree, which is often not the case when a skill is invoked.

Full rationale for everything here lives in `adr/0019`, `0022`, `0023`, `0024`, `0025`
in this (`adhd-skills`) repo. This file is the condensed, actionable version.

## Contents
- [The seven-criteria bar](#the-seven-criteria-bar)
- [Tag vocabulary and the two axes](#tag-vocabulary-and-the-two-axes)
- [Per-kind assessment table](#per-kind-assessment-table)
- [:runbook: vs :permanent: — the think/do test](#runbook-vs-permanent--the-thinkdo-test)
- [Entity hubs — adjusted criteria](#entity-hubs--adjusted-criteria)
- [Structure notes — hub-and-spokes, not a new tag](#structure-notes--hub-and-spokes-not-a-new-tag)
- [Literature notes — Orientation / Capture / Reflection](#literature-notes--orientation--capture--reflection)
- [Legacy :resource: migration](#legacy-resource-migration)
- [Notes evolve by append, not rewrite](#notes-evolve-by-append-not-rewrite)
- [Approximating backlinks without the org-roam database](#approximating-backlinks-without-the-org-roam-database)
- [Journal boundary](#journal-boundary)

---

## The seven-criteria bar

A note earns its place in the graph only if it clears all seven (ADR 0019). Criteria
1–4 are *structure* — mechanical, fast to check. Criteria 5–7 are *thinking* — the
integration work that actually gets deferred. **When a note feels stuck, the gap is
almost always at 5–7, not the structure.**

1. **Atomic** — one idea. If the note needs "and" to describe it, it's two notes.
   Atomicity is about *linkability*, not size: the test is "would I ever want to link
   to this idea without the others around it?" If yes, it's its own atom.
2. **Self-retrieving title** — a claim, not a topic label. You'd recognise it as
   relevant when searching months later. *"Under-extraction causes sourness"* retrieves;
   *"Coffee"* doesn't.
3. **At least one link** — ideally motivated by the ramification (#7). Zero links means
   the note functionally doesn't exist in the graph. A link should answer "what would I
   naturally navigate to next?" — not "what category does this belong to?" A taxonomic
   link (a runbook linking to a generic domain hub) just restates the title; the
   meaningful link is the specific context that prompted the note.
4. **Lifecycle tag** — one of the active FILETAGS. No note should be untagged.
5. **In your own words, standalone** — understandable without the source or the
   conversation that produced it. This is the integration act; a paraphrase or a paste
   does not satisfy it.
6. **A claim** — it asserts something, not merely names a subject.
7. **Ramification** — the "so what." May live in the body, or be carried entirely by
   the links (a claim whose consequences are other linked notes). A claim with neither a
   stated consequence nor a consequential link is an assertion floating in space.

**When assessing 5–7, probe — don't draft.** Ask the question and let the note's owner
answer it in their own words. Drafting the claim or ramification for them defeats the
purpose: the comprehension→integration step is the actual cognitive work the
zettelkasten exists to produce, and it has to be theirs.

---

## Tag vocabulary and the two axes

FILETAGS answer questions on **two orthogonal axes**, plus a faceting layer and a few
structural markers (ADR 0025). A note can carry one tag from each axis.

**Function / lifecycle axis** — *do you open this note to think, or to do?*

| Tag | Meaning |
|---|---|
| `:fleeting:` | Raw capture; needs elaboration into a permanent note |
| `:literature:` | Notes on a specific source; aspires to progressive summarisation |
| `:permanent:` | Elaborated, standalone idea in the writer's own words |
| `:runbook:` | Procedural knowledge — how to do something step by step |
| `:list:` | Open collection, added to and scanned over time — no triggering task, no claim (ADR 0027) |

**Entity-type axis** — *what is this note's referent?* These are **relationship**
labels, not object-kinds.

| Tag | Meaning |
|---|---|
| `:person:` | A being owed care — notes about specific people |
| `:business:` | An org transacted with in a particular context |

**Context/domain facets** — sparse, faceted, earned at critical mass *and* a stated
handling distinction (ADR 0027) — `:tulip:` is currently the only one that clears both
(Confluence/Jira treated as canonical source; link, don't regurgitate). Not a full
taxonomy — don't pre-create one for an anticipated future topic, and don't add one on
volume alone without naming what you'd do differently because of it.

**Structural markers** — node roles outside the two knowledge axes: `:project:`,
`:area:`, `:journal:` (a one-way fleeting husk, see below).

**Status overlay** — `:archive:` marks a note as stale/no-longer-relevant, independent of
both axes (it can sit alongside any lifecycle tag, or none). It is a documented stopgap,
not a permanent design choice (ADR 0028): it exists because `:project:` retro/closure
doesn't yet happen reliably, and names that gap honestly rather than pretending the
closure discipline is already in place. Revisit whether it's still needed once project
retros are reliable.

**A candidate new tag must pass two gates** (both, not either):
1. **Handling distinction** (quality, ADR 0025) — does the tag change what you actually
   *do* with the note? A tag that dodges think-vs-do (`:resource:`), or is true of every
   referent (a generic "has-a-referent" tag), carries no information however true it is.
2. **Critical mass** (quantity, ADR 0019) — will enough notes share it to justify
   navigating by it? A topic that will only ever sit on a handful of notes is better
   served by a link.

If a tag debate is running long, it's usually a candidate failing one of these two
gates — name the gate rather than continuing to argue the merits.

---

## Per-kind assessment table

| Kind | Shape question | Link check |
|---|---|---|
| `:fleeting:` | Is there a claim worth elaborating, or is this stale? | No links expected — unprocessed by definition |
| `:literature:` | Faithful to the source, in the writer's words? Has it produced permanent notes? See the dedicated section below. | `:ROAM_REFS:` to source; ideally outgoing links to the permanent notes it seeded |
| `:permanent:` | All seven criteria above — especially 5–7 | At least one outgoing link to a concept; check for incoming links too |
| `:runbook:` | Findable from the task it serves? Still accurate? | Check incoming links — something should point here from the context that needed it |
| `:list:` | Still an open collection being added to, or has it gone stale/dead? | No links expected — it's a standing backlog, not a graph node |
| `:person:` / `:business:` | See "Entity hubs" below | Destination nodes — check incoming links primarily |
| `:project:` | Linked to GTD? Has an outcome / done-looks-like? | Outgoing to GTD; incoming from permanent notes it draws on |
| `:area:` | Reflects current state of this domain? | Both outgoing (active projects, permanent notes) and incoming |
| `:resource:` (legacy) | What is this actually? | Retag to `:runbook:` or `:permanent:` first — see migration section |
| No lifecycle tag | Definite gap — name it before assessing anything else | — |

Notes on links:
- `:fleeting:` — no links expected; the note is unprocessed by definition.
- `:permanent:` — outgoing links are required; a permanent note with none does not
  functionally exist.
- `:runbook:`, `:person:`, `:business:` — destination nodes; check for incoming links.
  No incoming links means the note is unreachable.
- **Multiple lifecycle tags** (e.g. `:literature:` + `:fleeting:`) — apply the more
  specific tag's criteria. `:fleeting:` signals "unfinished," not a different kind.

---

## `:runbook:` vs `:permanent:` — the think/do test

One question decides it: **would you open this note to *do* something, or to *think*
about something?**

- *Do* → `:runbook:`. Need not be atomic or claim-titled. A multi-step procedure or
  reference list is fine. Only tests: findable from the task it serves, still accurate.
- *Think* → `:permanent:`. Must clear all seven criteria above.

*"Low-caloric-density foods"* is a lookup list — `:runbook:`. Rewritten as *"Caloric
density determines satiety per unit volume, not calories per serving"* it has become a
claim — `:permanent:`.

A note that looks like reference material but has a claim hiding in it belongs in
`:permanent:` — write the claim if it isn't there yet.

---

## Entity hubs — adjusted criteria

`:person:` and `:business:` notes are a different *species* from claim atoms, and the
seven criteria apply with adjustments (ADR 0025):

- **A noun title is correct** — the entity's name *is* the retrieval key. Criterion 2
  ("a claim, not a topic") governs claim atoms, not entities.
- The note's job is to **be a stable referent and collect spokes**, not assert a claim.
- It should stay **thin** — a pointer, especially to an external system of record where
  one exists. The note's unique value is cross-links and lived detail, not a copy of
  what's already recorded elsewhere.
- **Atomicity is judged by *referent*, not *idea***. A hub holding a definition +
  what-it-does + a pointer to detail is still atomic (all one referent). It breaks only
  when a separable *claim* accumulates inside it — that claim graduates to its own
  `:permanent:` spoke.
- Facts that are really claims about the entity graduate to their own atoms that link
  back to the hub.

When assessing a `:person:`/`:business:` note, apply this hub reading — don't fail it
for having a noun title or for being thin.

---

## Structure notes — hub-and-spokes, not a new tag

When several specific claims together support one general claim, keep them as separate
atoms with a **structure note** over them — don't collapse into one note. Collapsing
destroys linkability: you can no longer point at one claim without dragging in the rest.

**The link test**: would you ever link to one of these without the other two? Yes → keep
them separate, add a structure note. No → they were one note all along.

A structure note is tagged `:permanent:` — hub-ness is a *function*, carried by content
(claim-title + link-dense body) and surfaced by org-roam backlinks, not a separate tag.
Do not suggest inventing a `:structure:`/`:moc:` tag.

---

## Literature notes — Orientation / Capture / Reflection

Literature notes are **capture containers**, not a fixed form (ADR 0022) — assess them
against this process, not against the old five-section Adler template (Author/Type/
Status + prose fields), which is deprecated and was demonstrably unused.

Current template (`templates/literature.org`) has three headings:

1. **Orientation** — a `Kind / subject context` cue, read along Aim (theoretical vs.
   practical) / Authority / Incentive. Quick, answerable from the intro/skim.
2. **Capture** — the source outlined as atomic sub-headings, each with its own `:ID:`,
   in the writer's words, titled as a claim. Three kinds: **propositions** (claims),
   **terms** (vocabulary — these become linkable hubs), **arguments** (links between
   propositions via `[[id:]]`). Reactions caught inline as `[insight: ...]` — these are
   permanent-note larvae.
3. **Reflection** — run after working through the source: Unity (one sentence, what is
   the whole source saying), "Is it true?" (Adler's four failure modes — uninformed /
   misinformed / illogical / incomplete), "What of it?" (what changed, what you'll do).
   This is the graduation pass.

**What to check when assessing a literature note:**
- Does it have `:ROAM_REFS:` pointing at a source (citekey or URL)? Missing this is a
  structural gap.
- Is the Capture section actually atomic sub-headings in the writer's words, or a raw
  paraphrase/summary block? A wall of prose that just restates the source hasn't done
  the Capture work yet.
- Are there `[insight: ...]` markers or claims that look ready to graduate but haven't?
  That's the natural next action to name.
- **The graduation test is authorship, not importance.** A point from the source —
  however important — stays a headline-node in the container. A claim that is the
  writer's *own* graduates to a standalone `:permanent:` file. A source proposition can
  graduate later, but only once the writer has added their own claim to it.
- Tag should be `:literature:fleeting:` until processed, then `:fleeting:` is shed.
- Sub-heading IDs should be added only when something intends to link to that heading —
  not eagerly on every heading at capture time.

Literature notes link to each other only when the source itself cites or responds to
another source. A thematic connection noticed between two sources belongs in a
permanent note, not in either literature container.

**Filename note**: literature notes captured via citar/Zotero use a Better BibTeX
citekey-derived filename (`${citar-author} (${citar-date}) - ${citar-title}`); notes not
from Zotero use the regular `YYYYMMDDHHMMSS-slug.org` scheme. Filenames are not
authoritative either way — org-roam identifies notes by `:ID:`, tracked in its own
sqlite database, not by filename or path. Don't infer a note's kind or freshness from
its filename pattern.

---

## Legacy `:resource:` migration

`:resource:` is a function-axis dodge — it names "reference-y knowledge" instead of
answering think-vs-do, and is being retired. When encountering one:

- Has a procedure or step-by-step content → retag `:runbook:`.
- Has a claim expressible in the writer's own words → retag `:permanent:` (write the
  claim if it isn't there yet).
- Pure lookup table with no claim → retag `:runbook:`.

Ask what the note actually is before assessing further — don't guess.

---

## Notes evolve by append, not rewrite

When later thinking changes an existing note's claim, the fix is never to rewrite the
original text in place (ADR 0024). If a note you're assessing is now stale or
contradicted by something newer:

- The correct move is an explicit, dated append: `[Update YYYY-MM-DD: resolved — see
  [[id:...][title]]]` — never overwriting the original claim.
- Don't suggest a rewrite. Don't suggest manually mirroring a reverse-link either —
  org-roam's backlink buffer already handles that discoverability automatically.
- An explicit inline update is warranted only when a bare backlink can't do the job:
  correcting a now-false assertion in the note's own text, or naming the relationship
  ("resolved by", "superseded by", "complicated by").
- The prior thinking — including the tension or the being-wrong — is itself valuable
  content. Don't treat "this is now outdated" as a reason to delete or erase it.

---

## Approximating backlinks without the org-roam database

org-roam determines the link graph from a sqlite database built by parsing the `.org`
files — it is not derivable from filenames or directory structure. Without database
access, approximate incoming links by searching the notes tree for the target note's
`:ID:` value as a literal string (it will appear inside a `[[id:UUID]]` link in any note
that links to it). This is a reasonable approximation, not a guarantee — org-roam
aliases and fuzzy title-based links won't be caught by an ID-only search, so treat a
zero-result search as "probably unlinked," not certain.

---

## Journal boundary

Journal entries (`notes/journal/YYYY/MM/YYYY-MM-DD.org`) are a **one-way feed** (ADR
0023) — this matters when deciding whether a journal-adjacent item is in scope for note
critique:

- Going forward, no heading inside a journal file should carry a `:PROPERTIES: :ID:`
  block. If one is found (legacy), that's the cue to extract it into a proper note (or
  delete it) and strip the `:ID:` from the journal heading — not to critique it in place
  as if it were a processed note.
- Journal entries are not linked to each other and are not back-linked from notes that
  extracted material from them. Don't suggest adding these links.
- The journal is date- and full-text-addressable already; it doesn't need graph
  discoverability the way permanent notes do.
