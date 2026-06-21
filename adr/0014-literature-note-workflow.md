# 0014: Literature note workflow — capture container, atomic graduation

**Date**: 2026-06-21
**Status**: Accepted

## Context

The literature note template was an Adler-by-the-book form: bibliographic metadata
(Author/Type/Status) plus five prose sections (Why I read this, Core claim, What landed,
Notes generated, Open threads). It was effectively unused — ~530 literature notes exist,
most unprocessed, and the prose sections sat blank. The sections were obligation-fields
positioned at the top, demanding distillation *before* reading; that friction meant they
were never filled. The template modeled an aspirational process, not the one that works.

The decisive evidence was a *success case*: the "HealthyGamerGG – Dr. K's Guide" notes,
the user's best finished literature work, ignored the template's structure entirely and
used a different, repeatable shape. The redesign reverse-engineers that working process
rather than prescribing an ideal.

## Decision

A literature note is a **capture container** that encodes the process that actually works.

### Three-stage structure (mirrors Adler's stages *and* the temporal flow of reading)
- **Orientation** (structural / before): a quick fillable `Kind / subject context` cue
  (read along the Aim / Authority / Incentive axes), answered from the intro/skim.
- **Capture** (interpretive / during): the source outlined as atomic nodes.
- **Reflection** (critical / after): non-nagging comment cues for the graduation pass.

### Capture: atomic, in the container
Each point is its own (sub)heading with its **own `:ID:` + source ref**, in the user's
words, titled as a claim. Three kinds to capture: **propositions** (claims), **terms**
(vocabulary — these become linkable hubs), **arguments** (links between propositions via
`[[id:]]`). This *is* Adler's structural + interpretive reading — performed by capturing
well, not as separate steps. The `* Capture` heading is also the org-noter root.

### Insight larvae and graduation
Personal reactions are caught inline as `[insight: ...]` — integration captured the moment
it sparks. Selected atoms (insights + any answer that is the user's *own claim*) **graduate
into standalone `:permanent:` notes**. This graduation is the comprehension→integration
step (cf. [[0012]]) — and the user's known bottleneck — so the Reflection cue places the
prompt exactly where the friction is.

The dividing line for headline-vs-file is **authorship, not importance**. A point from the
source — however important — stays a headline-node in the container; a claim that is the
user's *own* graduates to a standalone file. A source proposition can graduate later, but
only once the user has added their own claim to it — at which point it has become their
thought, prompted by the source. This is the operational test behind the rejected
"fragment per key point" alternative below: the question is never "is this a key point?"
but "whose claim is this?"

### Adler, folded in by where it earns its place
- **Embodied in capture structure** (no field): outline, leading propositions, coming-to-
  terms, arguments. Naming them in the capture cue guides atomization at no cost.
- **Reflection cues** (genuine critical effort, kept as comments): Unity; "Is it true?"
  broken into Adler's four failure modes (uninformed / misinformed / illogical /
  incomplete); "What of it?".
- **Orientation**: `Kind` extended for online sources along three axes — Aim
  (theoretical/practical), Authority, Incentive. The incentive/trust axis is the modern
  addition Adler could assume away when production had gatekeeping.
- **Omitted**: classify-as-bureaucracy, solved/unsolved, and the meta-maxims — adding the
  full apparatus as fields is what made the old template a hindrance.

### Tagging
New literature notes default to `:literature:fleeting:`; `:fleeting:` is shed once the note
is processed/graduated — the provenance (`:literature:`) vs. maturity (`:fleeting:`)
rationale lives in [[0012]].

### Unity placement
Deliberately filed under Reflection, not Orientation (where Adler puts it). You can only
X-ray the whole *after* reading it, and the unity statement is the prime permanent-note
seed — so it belongs with the graduation pass.

## Alternatives considered

**Keep the five-section Adler template** — rejected; demonstrably unused (obligation-
friction, blank sections).

**Fragment into a separate literature-note file per key point** — rejected. Atomic points
live as headings-with-IDs *inside* the container (low friction, still linkable); separate
files are reserved for the `:permanent:` graduation layer. Atomicity is about linkability,
not file count (cf. [[0012]]).

**Pure capture container, no reflection prompts** — rejected; loses Adler's genuinely
useful critical questions.

**Adler cues as fillable sections** — rejected; recreates the obligation-friction. Kept as
comments under a findable `* Reflection` heading: structure without obligation.

## Consequences

- `templates/literature.org` rewritten to Orientation / Capture / Reflection.
- The Orientation `Kind` cue is the only fillable prompt — a deliberate experiment. If it
  goes unfilled across several sources, demote it to a comment-cue.
- Relationship to [[0012]]: this is the literature→permanent pipeline. The seven-point bar
  applies to *graduated permanent notes*; literature atoms are atomic-but-faithful.
- Validation is empirical and only the user can run it: does the next source fill this more
  naturally than the old template did?
