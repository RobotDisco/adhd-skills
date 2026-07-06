# 0017: org-timeblock as the daily planning view

**Date**: 2026-06-01
**Status**: Accepted

## Context

Daily planning requires seeing two things together: today's calendar commitments (from
gcal) and today's task candidates (from personal.org) — then fitting tasks into the
available gaps. Sunsama provided this via a visual drag-and-drop interface: you could
see fixed calendar blocks and drag tasks into free slots until the day was full.

The org-mode equivalent needed evaluation. Two candidates:

1. **org-agenda with org-super-agenda** — a custom "D" agenda command grouping today's
   tasks by section (Calendar, Overdue, Today, Routine, Waiting). Grouped list view,
   no visual fit-check against calendar gaps.

2. **org-timeblock** — a dedicated buffer showing a visual day timeline with calendar
   events and tasks as blocks. Supports drag-and-drop scheduling into time slots.

## Decision

**org-timeblock** is the primary daily planning view.

org-super-agenda is useful for grouping within single-query agenda views (e.g. a personal
week view). It is not needed on existing multi-block agenda commands, which already use
`org-agenda-overriding-header` to structure sections. The scope of org-super-agenda is:
single-query views where auto-grouping adds signal; not multi-block commands where
explicit query-per-section gives better control.

The "D" personal day agenda command (org-agenda + org-super-agenda) is retained as a
prototype during tool familiarization. It may be removed once org-timeblock is the
established habit.

## Alternatives considered

**org-agenda "D" command with org-super-agenda groups** — rejected as primary daily view.
Provides a well-organized task list but no visual calendar fit-check. Cannot answer "do
my tasks fit between my meetings?" without mental arithmetic. Kept as a fallback/prototype.

**Pure mental arithmetic** — rejected. Workable for very light days but breaks down when
calendar is fragmented. Time blindness makes this unreliable.

## Consequences

- Morning planning step for personal tasks is: open org-timeblock, arrange pre-scheduled
  tasks into available time slots. This is arrangement, not scheduling — tasks must already
  have a SCHEDULED date to appear.
- org-timeblock requires tasks to be scheduled before they appear in the view. This is a
  useful forcing function: only explicitly committed tasks appear.
- The "D" agenda command may surface during the familiarization period and should not be
  removed until org-timeblock is the established default.
