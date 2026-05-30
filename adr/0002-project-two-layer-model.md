# 0002: Project two-layer model

**Date**: 2026-05-26
**Status**: Accepted

## Context

Multi-step projects require two different kinds of tracking: the knowledge layer (what is the
goal, what decisions have been made, what have we learned?) and the execution layer (what is
the current next action, what is the lifecycle state?). These have different update cadences,
different audiences (one is for thinking, one is for doing), and different tools suit each.

Mixing both into the same structure creates noise in the daily task view and loses the
knowledge graph connections.

## Decision

Projects use a two-layer model:

1. **Brain layer (knowledge tool):** holds the goal, context, decisions, learnings, and
   connections to other knowledge. This is where you think.

2. **Execution layer (project tracker):** holds lifecycle state and task breakdown.
   This is where you act.

Only the immediate next action from each active project appears in the daily task list,
linking back to the project tracker entry (which links to the brain note).

## Alternatives considered

**Single layer in the task list** — rejected. Puts project knowledge (plans, decisions,
reference material) alongside daily scheduling. The daily view becomes noisy with project
context that shouldn't appear day-to-day, and the knowledge graph is lost.

**Single layer in the knowledge tool** — rejected. Knowledge tools are not task schedulers.
Items don't appear in a daily agenda; lifecycle state tracking is awkward.

## Consequences

- In the current org-mode implementation: brain layer = org-roam (`:project:` filetag);
  execution layer = `projects.org` (doesn't exist yet, needs creating); daily task list
  = `personal.org * Active`.
- Project decomposition is a separate pass — not done during inbox triage. Project-shaped
  items are flagged and left in the someday queue until a dedicated pass.
- The link chain is: daily task list → project tracker entry → brain note.
  Do not skip layers or duplicate structure across them.
