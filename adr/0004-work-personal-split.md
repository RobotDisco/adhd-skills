# 0004: Work/personal task split

**Date**: 2026-05-26
**Status**: Accepted

## Context

Some tasks are work-related. The question is where they live: all in the personal system,
all in a work tool, or split by some criterion. Putting everything in one place is simple
but noisy. Putting everything in the work tool loses career-arc tracking. The split
criterion needs to be durable and unambiguous at triage time.

## Decision

**Operational work** (sprint tasks, team work, on-call, role-specific work) belongs in the
**work tool**.

**Career-adjacent work** (career development, learning, research, skill-building) belongs in
the **personal system**, tagged as work-adjacent.

Rule of thumb: **if it would disappear when you change jobs, it's operational → work tool.
If it builds your capacity as an engineer or person, it stays in the personal system.**

## Alternatives considered

**Everything in the personal system** — rejected. Operational sprint work creates noise and
duplicates the work tool's tracking. Standups, ticket updates, and sprint ceremonies don't
belong in a personal GTD system.

**Everything in the work tool** — rejected. Career development and learning goals are
personal investments that persist across employers. Losing them to a work tool means losing
the arc of professional growth.

## Consequences

- The `work` category tag is a routing signal, not a context tag. It signals "this belongs
  to my career, not a specific employer."
- In the current implementation: work tool = Sunsama; personal system = `personal.org`;
  tag syntax = `:work:`.
- During inbox triage: operational items → work tool (remove from personal system); career
  items → personal someday queue with `work` tag.
- The distinction is sometimes ambiguous. When in doubt: would this task make sense on a
  resume or in a 1:1 with a future manager? If yes, it's career-adjacent → stays here.
