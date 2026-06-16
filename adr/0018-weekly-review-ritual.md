# 0018: Weekly review ritual — full sweep checklist

**Date**: 2026-06-08
**Status**: Accepted

## Context

The GTD system has two triage flows: inbox triage (processing captures into the system)
and Active board review (ensuring commitments are honest and actionable). Neither alone
constitutes a complete weekly review. A full weekly sweep requires both, plus passes over
Routine, Tickler, and housekeeping that neither flow covers.

Without a defined ritual, the review is inconsistent — some passes get skipped, drift
accumulates, and the system loses trust.

## Decision

The full weekly review runs in this order:

### 1. Inbox triage (prerequisite)
Run the `gtd-triage` skill first if `inbox.org` has items. All captures must be routed
before reviewing the rest of the system.

### 2. Routine / Habits audit
- Check `LAST_REPEAT` dates. Any habit lapsed 2+ weeks: is it still a real commitment?
  Apply the stuck-project intervention policy (ADR 0012) — re-activate, PAUSED, or remove.
- No stale habits should sit silently in Routine.

### 3. Tickler
- Promote any items whose date has arrived to Active.
- Remove any items that are no longer relevant.

### 4. Active board review
For every item in Active:

**Single actions (NEXT/DOING/WAITING):**
- Is this still a real commitment? If not, demote to Someday or delete.
- WAITING items: still blocked? Can it be unblocked this week?
- DOING items: still in flight? If stalled, back to NEXT or demote.

**Projects (ACTIVE/PAUSED):**
- Does every project have a NEXT sub-item? If not, it is stuck — apply ADR 0012.
- Does every project have a Goal and Ramification in its body? Add if missing.
- Check deadlines — anything due soon that needs a schedule change or escalation?
- PAUSED projects: is the pause still intentional? Still valid to return to?

### 5. Someday scan
- Scan for anything ready to promote to Active.
- Delete anything that will never happen.
- Keep the list honest — Someday is not a graveyard.

### 6. Housekeeping
- Delete DONE items from `inbox.org` (not archived — Syncthing history is the safety net).
- Archive DONE/CANCELLED items from Active (via `org-archive-subtree`).
- Resolve and delete any `SFConflict` files.

### 7. Honest commitment check (meta)
After all passes: is everything in Active something genuinely being worked on this week
or next? If the list still feels too large, demote without guilt. Active should create
clarity, not anxiety.

## Alternatives considered

**Inbox-only sweep** — rejected. Inbox triage alone keeps captures flowing but doesn't
audit existing commitments. Active drift goes undetected.

**Ad-hoc review** — rejected. Without a defined order, passes get skipped inconsistently.
The Routine and Tickler passes are the easiest to forget and the most useful when done.

**Daily micro-review instead of weekly** — not rejected, complementary. A daily planning
pass (org-timeblock) handles execution-layer scheduling. The weekly review handles
commitment-layer honesty. Both are needed; neither replaces the other.

## Consequences

- The `gtd-review` skill should implement this checklist as its structure.
- Inbox triage is a prerequisite, not part of the review itself — run `gtd-triage` first
  if `inbox.org` has items.
- The review is not timed but should feel completable in 20–30 minutes on a healthy system.
  If it consistently takes longer, the Active board is too large.
