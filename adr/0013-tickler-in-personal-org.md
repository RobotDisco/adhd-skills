# 0013: Tickler section in personal.org

**Date**: 2026-06-01
**Status**: Accepted

## Context

GTD requires a tickler mechanism — a way to resurface items at a specific date or seasonal
trigger without cluttering the active task list. The item isn't a commitment; it's a deferred
decision: "remind me to think about this when the time is right."

The existing `tickler.org` file holds recurring tasks organized by life area. It is a
different thing — more of a periodic review scaffold than a date-based resurfacing mechanism.

## Decision

Tickler items live in a `* Tickler` section within `personal.org`, alongside `* Routine`,
`* Active`, and `* Someday`.

The mechanism is a `SCHEDULED:` date, but the semantics differ from Active: the scheduled
date means "review this" not "do this." At that date the item surfaces in the agenda; the
response is to promote to Active, delete, or reschedule further out.

Minimum content per tickler item: one line of why + one line of what the NEXT would be
(same as Someday). No `:Effort:`, no Goal/Ramification framing — those get added at
promotion time.

Good candidates: seasonal items (window insulation → resurface September), conditional items
with a rough future date (family errand → resurface December). If there is no trigger date,
the item belongs in `* Someday` instead.

## Alternatives considered

**Separate `tickler.org` file** — rejected for current volume. Context-switching to a second
file adds friction that isn't justified when the tickler list is small. Revisit if the list
grows large enough to make `personal.org` noisy.

**Someday with a note** — rejected. A note ("remind me in September") is invisible to the
agenda. The `SCHEDULED:` date is what actually surfaces the item; a prose note does nothing.

**Using `tickler.org` (existing file)** — rejected. That file serves a different purpose
(recurring life-area reviews) and conflating the two would blur both.

## Consequences

- Tickler items share the `SCHEDULED:` mechanism with Active items but carry different
  semantics. The section boundary (`* Tickler`) is the signal that these are decisions,
  not commitments.
- The agenda will surface tickler items on their scheduled date alongside Active tasks.
  A skip function or agenda grouping (e.g. `org-super-agenda`) would cleanly separate them;
  for now, the `* Tickler` section heading is the only disambiguation.
