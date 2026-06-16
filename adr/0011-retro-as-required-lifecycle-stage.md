# 0011: RETRO is a required project lifecycle stage

**Date**: 2026-06-01
**Status**: Accepted

## Context

When a project's work is complete, two paths exist:

1. Mark it done immediately (COMPLETED/DONE).
2. Require a retrospective pass before closing — harvest learnings, link permanent
   notes, write the outcome — then mark it done.

The question is whether the retrospective is optional (done when energy permits) or
structural (a required gate before COMPLETED).

## Decision

RETRO is a **required lifecycle stage** between work-complete and COMPLETED. A project
cannot move to COMPLETED without passing through RETRO.

RETRO has a specific obligation: harvest learnings into the zettelkasten, link permanent
notes produced by the project, and write the project outcome. This requires an explicit
NEXT action — RETRO without a NEXT is stuck (see ADR 0012).

The lifecycle is: PLAN → ACTIVE → RETRO → COMPLETED (or ABANDONED at any point).

## Alternatives considered

**Optional retrospective** — rejected. If RETRO is optional, it will be skipped under
time pressure — which is exactly when projects end. Learnings from the most demanding
projects, where the most was learned, would be lost most reliably. Making it structural
removes the decision.

**Retrospective as part of ACTIVE** — rejected. Mixing execution and reflection in the
same state blurs the signal. When the work is done but the retro isn't, the project
needs a distinct state to surface in the stuck-projects check.

**No separate retrospective stage** — rejected. Without a structural gate, project
knowledge stays in the project note and never flows into the zettelkasten. The knowledge
layer and the execution layer decouple, defeating the purpose of keeping them linked.

## Consequences

- RETRO projects must appear in the stuck-projects check — they have a completion
  obligation, and without a NEXT they are genuinely stuck.
- During weekly review, RETRO projects are checked first — they are the closest to
  done and the easiest to close out.
- A RETRO NEXT looks like: "Write outcome + harvest permanent notes from [project node]."
  It is scheduled and effort-estimated like any other NEXT.
- *(Current implementation: `RETRO` state in the org-mode project TODO sequence.
  RETRO projects surface in `C-c a #` stuck-projects view if they have no NEXT subtask.)*
