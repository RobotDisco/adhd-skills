# Weekly Review Checklist

## Well-formed Active single action

| Property | Requirement |
|---|---|
| TODO state | `NEXT` (ready), `WAITING` (blocked on a person), `DOING` (in flight) |
| `:Effort:` | Required |
| `SCHEDULED:` | Optional — only when there is a real reason for a specific day |
| `DEADLINE:` | Only for true external deadlines (someone else cares about this date) |

Bare `NEXT` items without a date are pulled into org-timeblock on demand. A fake
scheduled date is worse than no date.

## Well-formed project

- Parent: `ACTIVE :project:` tag, Goal + Ramification in body text
- At least one `NEXT` sub-item (no `SCHEDULED:` or `:Effort:` required on the parent)
- Parent heading has **no** `SCHEDULED:` date — prevents agenda bleed
- Remaining subtasks: `TODO` state, no date
- `:ORDERED: t` when step sequence is strict

## Stuck project

A project is stuck when it has no `NEXT` sub-item, or its `NEXT` is stalled.
Required intervention (not optional rescheduling):
- **Re-activate** — new NEXT. Only if genuinely happening this week.
- **PAUSED** — parent state → PAUSED, inline note on why.
- **ABANDONED** — parent state → ABANDONED. Drift is not a state.

## Deadline horizon (14-day scan)

Before touching scheduling, check the near-term deadline window:
- Pull up all items with a `DEADLINE:` in the next 14 days
- For each: is there a scheduled NEXT with enough lead time to finish?
- If not: schedule it now, or flag it explicitly

A deadline with no scheduled work is an overdue decision, not just an overdue task.

## Overcommitment check

List all `:project:` parent headings in `* Active`. If the count is high, name it —
too many active projects is a system problem, not a scheduling problem.

## Well-formed Routine item

- `SCHEDULED:` with appropriate repeater (`.+Nd` for flexible, `++Nd` for fixed-day)
- `:STYLE: habit` property
- Anchor note above the state log (between `:END:` and first `- State "DONE"` line)
- `LAST_REPEAT` auto-maintained by org-mode

Staleness threshold: `LAST_REPEAT` more than two cycles past → habit may be broken.
Intervention: review and replace the anchor, not restart with willpower.

## Well-formed Someday item

- One line of **why** — what this would give you
- No Effort, no SCHEDULED, no Goal/Ramification

Someday promotion test: *"Do I have a scheduled slot and the motivation to start this
in the next two weeks?"* If unsure, leave it. Premature promotion creates Active debt.

## Well-formed Tickler item

Same minimum as Someday (why), plus a `SCHEDULED:` date that means "review this"
not "do this." At the scheduled date: promote, delete, or reschedule.

## WAITING semantics

`WAITING` = blocked on a **person**. If blocked on a condition or event, use `TODO`
with an inline note instead.

Stale threshold: flag any WAITING item older than one week for follow-up.

## Housekeeping checklist

- [ ] Delete DONE items from `inbox.org`
- [ ] Archive DONE/CANCELLED items from `* Active` via `org-archive-subtree`
- [ ] Resolve and delete any `SFConflict` files in `~/Documents/gtd/`

## Effort values

| Value | Meaning |
|---|---|
| `0:15` | Smallest trackable — fits in a gap |
| `0:30` | One Pomodoro |
| `1:00` | One focus block |
| `2:00` | Hard ceiling — if it wants more, decompose it |

For repeating tasks (`.+Xd`): Effort = today's session, not total remaining work.
