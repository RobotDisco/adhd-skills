# 0020: Brain/knowledge step in weekly review

**Date**: 2026-06-15
**Status**: Accepted

## Context

ADR 0018 defines the weekly review ritual as a GTD-only sweep (inbox triage → habits →
tickler → active board → someday → housekeeping). The brain repo (org-roam zettelkasten)
has its own weekly template (`brain/templates/weekly.org`) with a "Random Note Encounter"
and reflection prompts, but this has not been integrated with the GTD review into a single
coherent ritual.

The question is: should the brain step be a separate session on a different day, or part
of the same weekly review session?

## Decision

### The brain step runs in the same session, after the GTD sweep

The weekly review is one of the hardest rituals to initiate (high ADHD initiation cost).
Splitting it across multiple sessions means paying initiation cost twice, and the brain
step — having no deadline and no urgency — will quietly not happen.

The brain step runs last, after the GTD sweep, as a lighter "landing" phase. The cognitive
mode shift is intentional: GTD review is administrative and executive-function-heavy; the
brain step is generative and lower-demand. Sequencing the lighter work after the heavier
work uses the energy gradient correctly. Reversing the order risks hyperfocusing on a note
and never reaching the GTD audit.

### The brain step has two parts

**1. Random note encounter (3 minutes)**
Open a random non-journal node via `C-c n r`. The filter (ADR 0019) excludes file-level
`:journal:` nodes; all other nodes are fair game. Spend up to 3 minutes with whatever
surfaces. The judgment question is: does this note meet the quality bar from ADR 0019?
If not, it needs sharpening, linking, or deletion — note that for now and move on.
This is not a rewrite session.

**2. Reflection prompts (open-ended)**
Scan the week's journal entries yourself before writing. Claude prompts; you answer.
The scanning is yours to do — outsourcing it would remove the cognitive exercise that
makes reflection valuable. Prompts (from the existing weekly template):
- What were my biggest wins this week?
- What did I learn this week?
- What tensions am I feeling? What is causing them?
- What felt good about this week?
- What should I prioritize next week?

### Amended weekly review order (supersedes ADR 0018 step ordering)

1. Inbox triage (`gtd-triage` skill) — prerequisite
2. GTD sweep (`gtd-review` skill) — habits, tickler, active board, someday, housekeeping
3. Brain step — random note encounter + reflection prompts
4. Done

## Alternatives considered

**Brain step on a separate day** — rejected. No deadline, no urgency — it will not happen.
The initiation cost argument is decisive for ADHD systems.

**Brain step first, GTD second** — rejected. Risk of hyperfocusing on a note and never
reaching the GTD audit. GTD review has a clearer done-state and should run while energy
is higher.

**Claude reads the week's journal entries to prime reflection** — rejected. The scan is
part of the reflection. Outsourcing it removes the cognitive exercise that builds the
pattern recognition the weekly review is designed to develop.

## Consequences

- ADR 0018 is amended: the weekly review now has a brain step as phase 3.
- A `brain-weekly-review` skill (or a top-level `weekly-review` skill) should implement
  the random note encounter prompt and the reflection sequence.
- The `C-c n r` keybinding in Emacs is the mechanism for the random note encounter —
  no Claude tooling required for that step.
- The skill design is still in progress; this ADR records the structural decisions made.
  Implementation details (skill name, exact prompt sequence) to follow.
