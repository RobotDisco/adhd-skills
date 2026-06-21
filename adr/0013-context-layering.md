# 0013: Context layering — where GTD/zettelkasten guidance lives

**Date**: 2026-06-21
**Status**: Proposed

<!-- SCAFFOLD: Context, Mechanics, and Alternatives are filled from the analysis.
     The Decision and Consequences contain **Decide:** prompts — fill these in your
     own words and flip Status to Accepted once the choices are made. -->

## Context

GTD/zettelkasten guidance is currently spread across three homes with no stated rule
for what goes where:

- `~/Documents/brain/CLAUDE.md` and `~/Documents/gtd/CLAUDE.md` — repo project instructions
- the `adhd-skills` plugin — skills (triage, weekly review) and ADRs (rationale)
- (implicitly) whatever a session happens to have loaded

Two problems result:

1. **Duplication / drift.** The same material now lives in more than one place. Example:
   the note-quality criteria are in both `brain/CLAUDE.md` and ADR 0012. Each copy is a
   place the guidance can silently diverge.
2. **Location dependence.** Project `CLAUDE.md` only loads when Claude starts inside that
   repo's tree. Starting elsewhere means the posture and guardrails are absent — even
   though the *work* (notes, GTD files) lives at known absolute paths.

## Mechanics (verified against Claude Code docs, 2026-06)

| Mechanism | Scope | Load timing |
|---|---|---|
| Project `CLAUDE.md` | cwd + ancestor dirs only | always-on (when in tree) |
| `~/.claude/CLAUDE.md` (user) | global, every session | always-on |
| Plugin skills | global once enabled | **on-demand** (description match or `/name:skill`) |
| Plugin agents/hooks/MCP/settings | global | event/selection-based |

Key constraint: **a plugin cannot inject always-on context.** There is no plugin-level
equivalent of a global `CLAUDE.md`. Plugins contribute on-demand skills/agents/hooks/MCP
and default settings — nothing that loads into every session's system prompt automatically.

Consequence: "captured in one place" and "available from any folder, always-on" are *two
different requirements* that cannot both be satisfied by the plugin alone.

## Decision

Proposed three-layer split (refine and confirm):

### Layer 1 — `adhd-skills` plugin: portable methodology (single source of truth for *knowledge*)
Skills (rituals/actions), references (how-to, Emacs/org-roam layout, conventions), ADRs
(rationale). Location-independent but on-demand.

> **Decide:** What moves *out* of the repo CLAUDE.md files and *into* references here?
> (Candidates: tag vocabulary rationale, note lifecycle, literature/project note structure,
> the GTD↔brain triage rule.)

### Layer 2 — `~/.claude/CLAUDE.md`: the always-on entry (delivers "from any folder")
A *thin* layer: coaching posture + "zettelkasten at `~/Documents/brain`, GTD at
`~/Documents/gtd`, methodology in the adhd-skills plugin" + cross-cutting guardrails.

> **Decide:** How much posture goes here vs. a pointer? This file loads in *every* session,
> including unrelated coding — keep it lean to avoid token cost and noise. Full posture, or
> one-paragraph posture + "load the relevant skill"?

### Layer 3 — repo `CLAUDE.md` (brain/gtd): repo-operational facts only
Paths, the don't-edit-files rule, this instance's tag vocab — the things true of *this repo*
that you want always-on *when working in it*.

> **Decide:** Do the repo CLAUDE.md files (a) shrink to repo-ops + a pointer, (b) get
> eliminated entirely, or (c) stay as-is with methodology de-duplicated out? Note: the
> "don't edit my notes" guardrail should stay repo-level or user-level — NOT in a plugin
> skill, where it would only apply on-demand.

> **Decide:** De-duplication rule — when guidance has both a checklist and a rationale
> (e.g. note-quality), does the checklist stay in CLAUDE.md with rationale in the ADR, or
> does CLAUDE.md point at the ADR as the only copy?

## Alternatives considered

**Move both repo CLAUDE.md files wholesale into the plugin** (the original idea) — rejected.
Plugins are on-demand only; always-on guardrails (don't-edit-notes, coaching posture) would
degrade to "loads if a skill happens to trigger." Solves duplication, breaks always-on.

**Put everything in `~/.claude/CLAUDE.md`** — rejected. It loads in every session including
unrelated work; the full methodology there is token cost and noise 90% of the time. Reserve
it for a thin always-on entry point.

**Status quo (three uncoordinated homes)** — rejected. This ADR exists because the
duplication is already causing drift risk (note-quality criteria in two places).

## Consequences

> **Fill in once the split is decided.** Likely items:
> - Which references/skills get created or moved into `adhd-skills`.
> - What `~/.claude/CLAUDE.md` contains (and confirm it exists / is created).
> - How thin the repo CLAUDE.md files become; what stays.
> - A single de-duplication pass so each piece of guidance has exactly one home.
> - Update cross-references (CLAUDE.md ↔ ADR pointers) after the move.
