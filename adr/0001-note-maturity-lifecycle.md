# 0001: Note maturity lifecycle

**Date**: 2020-07-12
**Status**: Accepted

## Context

A zettelkasten contains notes at different stages of elaboration. Without a clear model of
what stages exist and how notes progress through them, the system accumulates undifferentiated
captures that are hard to triage, hard to find, and hard to act on during review.

The question is: what maturity stages exist, what does each mean, and how does a note move
between them?

## Decision

Three maturity stages:

**Fleeting** — raw capture. Needs elaboration before it has standalone value. The input
layer of the system. May be a half-formed thought, a quote, a reference, or an observation.
A fleeting note is a liability until processed.

**Literature** — notes on a specific source (book, article, video, talk). Tracks what the
source says, what changed your thinking, and what ideas it seeds. Aspires to progressive
summarisation. A literature note is source-scoped, not idea-scoped.

**Permanent** — an elaborated, standalone idea in your own words. Not tied to a source.
Atomic: one idea per note. The actual zettelkasten atom. The goal of the system.

**Lifecycle:** fleeting → (elaborate) → permanent note, or absorbed into a literature note.
A note with both `:fleeting:` and `:literature:` tags was captured from a source but not yet
fully elaborated — it is in transit.

## Alternatives considered

**No maturity distinction** — rejected. Without stages, all notes look the same regardless
of elaboration state. The inbox and the zettelkasten become indistinguishable, and the
weekly review has no signal for what needs processing vs. what is done.

**Two stages only (captured / done)** — rejected. Collapses the important distinction
between source-scoped notes (literature) and idea-scoped notes (permanent). Literature notes
and permanent notes have different structures, different review purposes, and different
roles in the knowledge graph.

**More than three stages** — rejected. Additional granularity (e.g. "in progress", "needs
links", "ready for review") creates taxonomy overhead without proportional benefit. ADHD
systems fail when the maintenance cost of the system exceeds the value it produces.

## Consequences

- Maturity is encoded as a FILETAG, making it queryable and visible at a glance.
- The weekly review scans for `:fleeting:` notes as the primary triage target.
- A large fleeting backlog is a system maintenance issue, not a personal failure.
- Permanent notes are the measure of the system's health — not note count overall.
- *(Current implementation: tags `:fleeting:`, `:literature:`, `:permanent:` as org-mode
  FILETAGS in org-roam. A note may carry multiple tags during transit between stages.)*
