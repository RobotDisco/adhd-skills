# 0016: Deadline semantics and near-term deadline visibility

**Date**: 2026-06-01
**Status**: Accepted

## Context

org-mode has two date properties that serve different purposes: `SCHEDULED:` and
`DEADLINE:`. Without a clear convention, these get conflated — tasks get DEADLINE dates
when the real meaning is "I'd like to finish this by X", or hard external deadlines go
untracked because there's no dedicated view.

`SCHEDULED:` also has two legitimate uses: allocating a specific day to work on something,
and deferring a task to the earliest date it can reasonably be started. Both are correct;
neither is a deadline.

Additionally, upcoming deadlines need to surface in the daily planning view and the
weekly review, so hard commitments don't slip past undetected.

## Decision

**Semantic distinction:**

- `DEADLINE:` = external commitment with a hard due date. Someone else cares about this
  date: a bill, a tax filing, a commitment made to another person. Missing it has real
  consequences outside your control.
- `SCHEDULED:` = when you plan to work on it, or the earliest it can reasonably be started.
  Covers both "I've allocated Thursday for this" and "don't show me this until April."

Self-imposed "I'd like to finish by X" targets are not deadlines — they are scheduling
preferences. Use `SCHEDULED:` and move the date if priorities shift. Reserving `DEADLINE:`
for genuine external commitments keeps the deadline list short and trustworthy.

**Near-term visibility:**

Upcoming deadlines surface in two places:
1. **Daily planning view** — an "Upcoming" group shows deadline-warning entries that fall
   within the warning window (items due within the next ~14 days).
2. **Weekly review** — a 14-day deadline horizon scan runs before scheduling decisions.
   Any deadline without scheduled lead time is an overdue decision, not just an overdue task.

## Alternatives considered

**Use DEADLINE for all "I want this done by" dates** — rejected. If every self-imposed
target is a DEADLINE, the list becomes noisy and untrustworthy. Real external deadlines
need to be visually distinct. Inflation dilutes the signal.

**No dedicated deadline visibility** — rejected. Deadlines that surface only incidentally
(buried in the agenda as an overdue item) get missed. A dedicated group and weekly horizon
scan make commitments visible before they become urgent.

**Show all deadlines regardless of warning window (full horizon view)** — deferred.
See open question below.

## Consequences

- The `DEADLINE:` list stays short and trustworthy — only genuine external commitments.
- Upcoming deadline warnings appear in the daily view in a named "Upcoming" group, before
  the discard rule hides everything else.
- Weekly review includes a deadline horizon scan as the first step before scheduling.
- *(Current implementation: org-super-agenda `:deadline future` group in "D" agenda
  command; `org-deadline-warning-days` default 14 days. Horizon scan step added to
  review-checklist.md.)*

## Open question

**Full-horizon deadline view** — showing ALL active deadlines regardless of how far out —
is a natural extension. Useful for knowing, at a glance, every hard commitment in the
system (a bill due in 3 months, a yearly tax date, etc.). Candidate: a dedicated "B"
(backlog/horizon) agenda command. Deferred until the backlog view design is decided.
