# 0025: Tags live on two axes — function and entity-type; a tag earns its place by changing how you handle the note

**Date**: 2026-06-24
**Status**: Accepted

## Context

`brain/CLAUDE.md` lists every FILETAG in a single flat table with one "Meaning"
column. That table silently conflates two different *questions* a tag can answer, and the
conflation is expensive: a session spent ~8 turns deciding whether `:tool:`, `:resource:`,
or a redefined `:reference:` should exist for a single vendor note (Smartling). The length
of that argument was itself the symptom — with no model of *what kind of question a tag
answers*, every proposed tag looks equally plausible, and the debate has no terminating
condition.

[[0019]] already supplied two relevant pieces: tags **earn their place at critical mass** (a
*quantity* gate), and **prefer links to taxonomy**. It also separated *lifecycle*
(`:permanent:`) from *function* (a structure note as hub), and on that basis rejected a
`:structure:`/`:moc:` tag. What 0019 did not give is (a) a model of the *axes* the tag
vocabulary runs on, and (b) a *qualitative* test for when a candidate tag is legitimate
versus a junk drawer. This ADR supplies both. Together they are the lens that resolves the
whole `:person:`/`:business:`/`:tool:`/`:resource:` family of questions in one move instead
of eight turns.

## Decision

### Tags answer questions on two orthogonal axes

- **Function / lifecycle axis** — `:fleeting: :literature: :permanent: :runbook:`. Answers:
  *do you open this note to **think** or to **do**?* (and, for the maturity tags, how far
  along it is). This is 0019's maturity ladder plus `:runbook:`.
- **Entity-type axis** — `:person: :business:`. Answers: *what **is** this note's
  referent?*

The two are orthogonal. A note can carry one tag from each: an entity hub is typed on the
entity axis, while the atoms that hang off it are tagged on the function axis. The flat
table hid this orthogonality, which is precisely why a function-axis tag (`:resource:`) and
an entity-axis question ("is Smartling a tool?") kept getting argued as if they were the
same kind of thing.

Two clarifications that keep this coherent with prior ADRs:

- **Context/domain facets** (`:tulip: :adhd: :career:`) are a *third, faceted layer* —
  neither axis — and per [[0019]] stay sparse and earned at mass. They mark "what life-area
  this touches," not what the note is or what you do with it.
- **Hub-ness is not a third tag axis.** Per [[0019]], a structure note's hub *function* is
  carried by its content (claim-title + link-dense body) and surfaced by org-roam
  backlinks, not by a tag. The two *tag* axes are function and entity-type only.

### A tag earns its place only by changing how you *handle* the note

0019 gave the *quantity* gate (critical mass). This is the *quality* gate, and a candidate
tag must pass **both**. The test:

> **Does this tag change what you actually do with the note?** If it carves no handling
> difference, it carries no information — however true it is.

There is one failure mode per axis, and naming them ends most tag debates on the spot:

- **Function-axis dodge** — a tag that sits on the function axis but *refuses to answer*
  think-vs-do. This is exactly `:resource:`: "reference-y knowledge" is a non-answer where
  an answer (`:runbook:` or `:permanent:`) is required. The deprecation recorded in [[0019]]
  follows directly — the migration is nothing more than *finally answering the question the
  tag was used to dodge*.
- **Type-axis non-distinction** — a tag on the entity axis that is true of *every* referent,
  or defined as "whatever the specific types didn't catch." A generic `:reference:` meaning
  "this note has a referent" is the *genus, not a species*: true of every hub, therefore
  zero information — tagging a hub "this refers to a thing" is like tagging a file "this is a
  file." A residual/catch-all bucket fills with whatever you couldn't be bothered to
  classify: the junk drawer rebuilt on a new axis.

### Entity-type tags must name a relationship, not an object-kind

The entity tags that work are *relationship* labels in disguise, and that is why they
dictate handling:

- `:person:` = **a being I owe care** — ethics, privacy, a relationship maintained.
- `:business:` = **an org I transact with** in a particular context.

"Tool" / "framework" / "appliance" name the object's *intrinsic kind*, which does **not**
dictate handling: a coffee grinder, a web framework, and a SaaS vendor are all "tools" yet
share no common handling. Object-kind is too broad to carve — your *relationship* to the
object is what carves. So `:tool:` fails the quality gate. If a genuine cluster exists —
e.g. "third-party dependencies my work relies on and must keep working" — name the tag
after *that relationship* (`:vendor:`, `:dependency:`), and mint it only once it also clears
0019's mass gate (a real "show me all of them" retrieval need or a shared handling ritual).

### Entity hubs are a note species with adjusted criteria

The seven criteria of [[0019]] are calibrated for *claim atoms*. Entity/reference nodes
(`:person:`, `:business:`) play by adjusted rules:

- a **noun title is correct** — the entity's name *is* the retrieval key (0019 criterion 2,
  "a claim not a topic," governs atoms, not entities);
- the note's job is to **be a stable referent and collect spokes**, not to assert a claim;
- it should stay **thin** — a pointer, especially to an external **system of record**
  (for `:tulip:` notes, Confluence/Jira is canonical: link, don't regurgitate; the note's
  unique value is your cross-links and lived gotchas, not a stale copy);
- **atomicity is judged by *referent*, not *idea*** — [[0019]]'s atomicity-as-linkability
  test still governs, but the unit shifts: a claim atom asks "one idea?", a hub asks "one
  referent?". A hub holding a definition + what-it-does + a pointer to detail is still
  atomic (all one referent). It breaks atomicity only when a separable *claim* accumulates
  inside it — at which point that claim graduates to a spoke;
- facts about the entity **graduate to their own atoms** that link back.

This is the entity-axis cousin of 0019's structure note — but with a deliberate asymmetry:
a structure note is `:permanent:` with a content-carried hub function and **no** tag,
whereas an entity hub **is** tagged, because entity-type is a genuine handling distinction
while hub-ness is not.

### "Explicit" means *decide*, not *always-tag*

`brain/CLAUDE.md`'s "no note should be untagged" / explicit-over-implicit rule demands you
**make the call**, not that every axis must carry a tag. Concluding "the entity-type axis
carries no handling distinction for this note" and leaving it untyped is a legitimate
*explicit decision* — distinct from drifting because you never considered it. The artifact
(no type tag) can look identical; the difference is whether a decision was made and is
defensible. Explicit-over-implicit governs the *decision*, not the tag count.

## Alternatives considered

**Keep the flat tag table (CLAUDE.md as-is)** — superseded, not wrong. The table is
accurate but silent on the axes, which is what let one vendor note run an 8-turn taxonomy
debate. CLAUDE.md should present tags grouped by axis.

**Mint `:tool:`** — rejected. Fails the quality gate (object-kind names no handling
distinction) *and* the 0019 quantity gate (no demonstrated retrieval need). Revisit as a
relationship-named tag (`:vendor:`/`:dependency:`) only if a real cluster surfaces.

**Redefine `:resource:`/`:reference:` to mean "has a referent"** — rejected. A type-axis
non-distinction (the genus) and a residual catch-all. The hub/spoke structure makes such a
tag *unnecessary*, not merely invalid: undifferentiated "stuff I know about X" becomes an
entity hub plus lifecycle-tagged spokes, leaving nothing for the generic tag to hold.

**Pre-create a generic entity tag for the future** — rejected per [[0019]]: do not
pre-create a tag for an anticipated future; let it be earned.

## Consequences

- `brain/CLAUDE.md` should restructure its FILETAGS section to group tags by axis
  (function/lifecycle · entity-type · context facet) and state the **two-gate test** —
  *handling distinction* (this ADR) **and** *critical mass* ([[0019]]) — that any new tag
  must pass.
- This ADR is the *structural* rationale behind 0019's `:resource:` → `:runbook:`/
  `:permanent:` deprecation: `:resource:` is a function-axis dodge.
- Pairs with [[0019]]: 0019 = the bar a note must clear + the quantity gate for tags; 0025 =
  the axes of the vocabulary + the quality gate. Relates to [[0023]] only in that the
  journal sits outside both axes (a one-way husk, not a graph node).
- When evaluating a `:person:`/`:business:` note, apply the **hub** reading of the seven
  criteria, not the atom reading — a noun title and link-density are correct there.
- Practical tell for the system-tweaking failure mode: **a tag debate that runs long is
  usually a candidate failing one of the two gates.** Name the gate and apply the test
  rather than continuing to design the container.
