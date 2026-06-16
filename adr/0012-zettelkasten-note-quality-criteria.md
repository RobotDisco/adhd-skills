# 0012: Zettelkasten note quality criteria and journal boundary

**Date**: 2026-06-15
**Status**: Accepted

## Context

The brain repo (~2,500 notes) uses org-roam across multiple lifecycle stages (`:fleeting:`,
`:literature:`, `:permanent:`, `:resource:`, `:runbook:`). Without explicit quality criteria, the graph
fills with half-formed captures that look like knowledge but aren't: topic stubs, aspiration
entries ("I should learn X"), and notes with no connections to anything else. These don't
participate in synthesis — they are dead weight with the appearance of a system.

A secondary question: journal files are the daily capture/log layer. They could technically
contain org-roam heading nodes (level 1+). Allowing this blurs the boundary between "captured
thought" and "processed knowledge," which is the distinction the weekly review is meant to
enforce.

This ADR applies across all active knowledge domains: hobby academia, hobby software
development, life/ADHD management, professional software development, and hobby pursuits
(coffee, etc.).

## Decision

### Necessary and sufficient qualities for an org-roam note

A note earns a place in the graph if and only if it satisfies **all** of:

1. **Atomic subject.** One thing. The title fully describes the scope. "V60 extraction" is a
   note. "Coffee" is a folder concept. "Why my V60 tastes sour AND my workflow" is two notes.

2. **Title that retrieves itself.** You would recognise it as relevant when searching months
   from now. For concept notes, a claim or question beats a topic label:
   *"Under-extraction causes sourness regardless of bean"* retrieves better than
   *"Coffee sourness"*.

3. **At least one link.** To a source (for `:literature:` notes) or a related concept (for
   `:permanent:` notes). A note with zero connections does not functionally exist in the
   graph — object permanence applies to knowledge.

4. **Lifecycle tag.** One of `:fleeting:`, `:literature:`, `:permanent:`, `:runbook:`.
   Tells you what processing state or kind the note is in. (`:resource:` is a legacy tag
   being migrated out — see below.)

Notes that fail:
- Pure aspiration without a claim ("I should meditate more")
- Topic labels broad enough to contain anything ("Software development")
- Notes with no links and no tags

### Additional quality for `:permanent:` notes

Written in your own words, expressing your actual position or synthesis — not a paraphrase
of a source. If a `:permanent:` note could be re-tagged `:literature:` without loss of
meaning, it isn't permanent yet.

### Additional quality for `:literature:` notes

The "core claim in your words" field must be filled in. A literature note without this is
unfinished.

### `:runbook:` vs `:permanent:` — procedural vs declarative knowledge

These two kinds are distinct because they are retrieved and used differently:

- **`:runbook:`** — procedural knowledge: how to do something step by step. A V60 recipe,
  an Istio setup guide, a morning planning checklist. You retrieve it to *execute*. It does
  not need to be atomic or claim-titled; it can be a multi-step procedure or reference list.
  The shape question is: is it findable from the task it serves, and is it still accurate?

- **`:permanent:`** — declarative knowledge: a claim about how something works, expressed in
  your own words. "Slower flow rate increases extraction yield." "Service meshes shift security
  from application to infrastructure layer." You retrieve it to *think*. It must be atomic,
  claim-titled, and linked to related concepts.

The test: would you open this note to *do* something, or to *think* about something?

Notes that look like `:resource:` but have a claim hiding in them belong in `:permanent:`.
A note titled "Low-caloric-density foods" is a `:runbook:` (a reference list). A note titled
"Caloric density determines satiety per unit volume, not calories per serving" is `:permanent:`.

### `:resource:` tag migration

`:resource:` is a legacy tag that conflated procedural and declarative knowledge. It is being
retired in favour of the `:runbook:` / `:permanent:` split. Migration path for existing
`:resource:` notes:
- Has a procedure or step-by-step content → retag `:runbook:`
- Has a claim expressible in your own words → retag `:permanent:` (and write the claim if
  it isn't there yet)
- Pure lookup table with no claim → retag `:runbook:`

Migration happens opportunistically during weekly review note encounters, not as a bulk sweep.

### Domain-specific applications

- **ADHD management:** the note must express a concrete claim or strategy, not an aspiration.
  "Brief meditation at pomodoro breaks reduces afternoon executive function crash" passes.
  "I should meditate" does not.
- **Professional/hobby software:** setup guides and procedures → `:runbook:`. Insights about
  why something works → `:permanent:`. "How to configure Istio mTLS" is a runbook. "mTLS at
  the mesh layer eliminates per-service certificate management" is permanent.
- **Hobbies (coffee, etc.):** recipes and brew guides → `:runbook:`. Observations about
  extraction dynamics → `:permanent:`.

### Journal files contain no org-roam nodes

Journal files are the capture layer. No heading within a journal file should carry a
`:PROPERTIES: :ID:` block — i.e., no org-roam nodes at any level inside journal files.

The weekly review is the processing gate: if a thought captured in a journal is worth being
in the knowledge graph, the weekly review is the moment to extract it as a proper note.
Allowing in-journal nodes blurs this boundary and lets half-processed captures accumulate
in the graph.

## Alternatives considered

**Allow heading-level nodes in journal files** — rejected. These pass the `C-c n r`
random-note filter (which only excludes file-level journal nodes) and would surface during
review as if they were processed knowledge. The confusion cost outweighs the convenience
of in-place linking.

**Topic-titled permanent notes** — rejected (Ahrens, Matuschak both agree). A topic title
makes the note a container, not an idea. Containers don't link meaningfully to other ideas;
they just collect children. The zettelkasten works through claim-to-claim connections.

**No quality bar — let the lifecycle tags do the work** — rejected. `:fleeting:` captures
are explicitly unprocessed, but nothing prevents them from accumulating indefinitely.
The quality bar is the criterion the weekly review uses to decide whether a fleeting note
has been properly processed. Without it, "processed" has no definition.

## Consequences

- The `C-c n r` keybinding filters out file-level `:journal:` nodes. No further filter
  change is needed if the journal-no-nodes rule is followed — heading-level journal nodes
  will not exist.
- The "does this note meet the bar?" question above is the core judgment in the brain
  weekly review step (see ADR 0013).
- Aspiration notes without concrete claims should be flagged during triage and either
  sharpened into a claim or deleted.
- The lifecycle tag requirement means every note has an explicit processing state or kind —
  no notes should exist without at least one of the four active tags (`:fleeting:`,
  `:literature:`, `:permanent:`, `:runbook:`).
- Existing `:resource:` notes are migrated opportunistically during weekly review encounters,
  not in a bulk sweep. Bulk sweeps stall; opportunistic migration accumulates.
