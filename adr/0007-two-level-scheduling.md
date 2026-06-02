# 0007: Two-level scheduling — weekly and daily

**Date**: 2026-06-01
**Status**: Accepted

## Context

Scheduling decisions need to happen at the right energy level. Sunsama bundled all
scheduling into a single morning planning session (~8am): pick tasks, arrange them into
time slots, done. This works but puts decision-making at a moment that is often
interrupted (post-standup) and forces fresh choices about priority at execution time.

The system design principle is: pre-decide at high-energy moments; execute without
deliberation. Scheduling involves two distinct decisions that have different natural homes:

1. **Which tasks happen this week?** — a weekly-scope question with access to the full
   backlog. Requires comparing options and considering deadlines. High cognitive load.

2. **Which tasks happen today, and when?** — a day-scope question that needs today's
   calendar to be known. Low cognitive load if the weekly pool is already decided.

## Decision

Two scheduling levels, each at the right moment:

**Weekly review** — week-level decisions:
- Promote Someday items to Active (set SCHEDULED to sometime this week)
- Ensure each project has exactly one NEXT action ready for the week
- Demote anything that didn't move back to Someday
- Output: a pool of Active items scheduled somewhere this week

**Daily (work signoff or night before)** — day-level decisions:
- On work days: during work signoff (~5pm), schedule personal tasks for the evening
- On personal days (Mondays, weekends): schedule the next day's tasks the evening before
- Output: tasks with specific scheduled dates that appear in tomorrow's daily planning view

**Morning planning** — arrangement only, no decisions:
- Open your daily planning view
- Arrange pre-scheduled tasks into available calendar gaps
- Sanity check: does the day fit?
- No fresh priority decisions — the pool is already decided

## Alternatives considered

**Single morning planning session (Sunsama model)** — rejected. Bundles decision and
arrangement into one 8am session. Decision quality at 8am is lower than at 5pm work
signoff. Post-standup interruptions fragment the planning window. Confirmed as a source
of friction in practice.

**Weekly scheduling only (set specific days at weekly review)** — rejected. Too rigid.
Calendar changes during the week (meetings added, energy shifts) require rescheduling
anyway. Week-level dates at review + day-level arrangement at signoff is more resilient.

## Consequences

- Work signoff is slightly heavier than a pure "close the laptop" ritual — it includes
  scheduling personal tasks for the evening/next morning. This is appropriate: 5pm is the
  highest-energy decision window of the day.
- *(Current implementation: daily planning view = org-timeblock in Emacs. Tasks require
  a `SCHEDULED:` date to appear in org-timeblock.)*
- Morning planning is faster — arrangement in org-timeblock, not deliberation.
- Tasks must have a SCHEDULED date before org-timeblock will show them. This creates a
  visible gap if the work signoff scheduling step was skipped.
- Weekly review must produce a concrete pool of Active items, not just audit status.
  A weekly review that leaves Someday untouched hasn't done its job.
