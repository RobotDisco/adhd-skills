# 0014: .+Xd repeater + per-session Effort as the daily planning mechanism

**Date**: 2026-06-01
**Status**: Accepted

## Context

Ongoing work — courses, books, daily practices — doesn't fit the standard GTD single-action
model. It isn't one task with one effort; it's a recurring commitment across many sessions.
The question is how to represent this so it shows up reliably in the daily agenda and
produces an honest picture of how much time is being committed today.

Sunsama solves this with explicit daily time-blocking. The goal is to replicate that
behaviour in org-mode without Sunsama.

## Decision

Ongoing multi-session work uses two properties together:

1. **`.+Xd` completion-relative repeater on `SCHEDULED:`** — the task reappears X days after
   the last completion, regardless of when it was scheduled. This prevents guilt-stacking if
   a session is missed (see ADR-0005 for the guilt-stacking principle).

2. **`:Effort:` = today's session commitment**, not total remaining work. A course with 8
   hours of content remaining gets `1:00` if today's session is one hour — not `8:00`.

Together these answer the Sunsama daily planning question: "what am I doing today and for
how long?" The repeater controls cadence; Effort controls daily commitment.

## Alternatives considered

**Effort = total remaining work** — rejected. A task showing `8:00` of effort gives no
useful information for today's planning. It also makes the effort field useless for
time-blocking, since you can never actually schedule "8 hours" on a given day.

**One task per session** — rejected. Creating a new task for each reading or study session
is capture friction that breaks ADHD systems. A single repeating task with a checkbox or
counter for progress is far lower friction.

**No effort on repeating tasks** — rejected. Without an effort estimate, the task appears
in the agenda but contributes nothing to daily load planning. You can't tell whether today
is a light or heavy day.

## Consequences

- Effort on any task with a `.+Xd` repeater always means "this session," never "total."
  This is a semantic convention that must be applied consistently — the field label doesn't
  distinguish them.
- Progress tracking (how far through the total work?) is handled separately: checkboxes
  for uniform sequential steps (e.g. course chapters), a `[/]` or `[%]` cookie on the
  parent heading when count matters.
- This pattern applies to habits, courses, ongoing reading, and any other work done in
  recurring sessions. It does not apply to one-shot tasks, which use Effort to mean
  total task size (bounded at 2:00 — if larger, decompose).
