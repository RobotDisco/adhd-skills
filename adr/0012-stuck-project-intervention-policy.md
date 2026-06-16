# 0012: Stuck project intervention policy — no drift

**Date**: 2026-06-01
**Status**: Accepted

## Context

Projects stall. A project can be structurally stuck (no NEXT action exists) or
temporally stuck (a NEXT exists but its scheduled date is in the past and hasn't moved).
Both are forms of drift — the project occupies Active without producing movement.

Drift is costly: it creates false load in the active commitments list, erodes trust in
the system ("why plan when things just sit here?"), and hides real overcommitment.

The question is what to do when a project is detected as stuck.

## Decision

A stuck project requires an **explicit decision**. Drift is not a valid state.

Three options, each named honestly:

**Re-activate** — the project is still happening. Create a new NEXT with a realistic
scheduled date. Only valid if the project will actually move this week.

**PAUSED** — the project is intentionally on hold. Mark the parent PAUSED with an
inline note explaining why and (if known) when to revisit. Removes it from the active
view without abandoning it.

**ABANDONED** — the project is no longer being pursued. Mark ABANDONED. Projects drift
and stop — this names it honestly rather than letting it accumulate as false load.

Rescheduling a stuck NEXT to next week without making one of these decisions is not
an option. It just defers the drift.

## Alternatives considered

**Default reschedule** — rejected. Automatically rescheduling a stuck NEXT treats drift
as a scheduling problem rather than a commitment problem. The project may no longer be
the right thing to do; rescheduling without examining that question is avoidance.

**Ignore stuck projects** — rejected. Drift accumulates. An Active list full of stalled
projects provides no signal about real capacity and makes the system untrustworthy.

**Single "inactive" state** — rejected. PAUSED and ABANDONED are meaningfully different:
PAUSED implies return; ABANDONED names that the project has stopped. Collapsing them
loses the distinction and makes the project list harder to interpret at review time.

## Consequences

- Two detection mechanisms, complementary:
  - **Structural** (no NEXT): caught by the stuck-projects view between weekly reviews.
  - **Temporal** (NEXT date past): caught by the weekly review skill's project health phase.
- Weekly review checks RETRO projects first (closest to done), then scans remaining
  projects for stuck status.
- PAUSED projects still appear in stuck-projects checks — intentional. "Is this still
  intentionally paused?" is a valid weekly review question.
- *(Current implementation: `C-c a #` for structural stuck check; `gtd-review` skill
  Phase 2 for temporal stuck check. Intervention states: `PAUSED` and `ABANDONED` in
  the org-mode project TODO sequence.)*
