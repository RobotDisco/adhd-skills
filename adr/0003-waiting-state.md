# 0003: State flag over a dedicated waiting collection

**Date**: 2026-05-26
**Status**: Accepted

## Context

Tasks blocked on someone else need to be tracked without cluttering the active work queue.
Two patterns exist: a dedicated waiting collection (items move there when blocked), or a
waiting state flag (items stay in place, state changes).

The collection approach groups all waiting items visually in one place. The state approach
keeps items in their project context and surfaces them through filtering.

## Decision

Use a **state flag** on the task itself — no dedicated waiting collection.

Waiting items stay in their original location and are surfaced via agenda filtering or a
grouped view.

## Alternatives considered

**Dedicated waiting collection** — rejected. Moving items out of their project context
orphans them from surrounding information (what project is this part of? what were the
dependencies?). It also requires a manual move back when the block clears, adding friction
and creating a second place to check.

## Consequences

- Waiting items must include a note on who/what is being waited on and a timestamp, so
  stale items surface during weekly review.
- In the current org-mode implementation: use the `WAITING` TODO state; surface via an
  org-agenda filter or `org-super-agenda` grouping.
- Weekly review should scan for waiting items older than ~1 week for follow-up or promotion.
