# Weekly Review Checklist

## Well-formed Active item

| Property | Requirement |
|---|---|
| `SCHEDULED:` | Every item in `* Active` |
| `:Effort:` | Every item in `* Active` — session effort, not total project size |
| TODO state | `NEXT` (ready to do), `WAITING` (blocked on a person), `DOING` (right now) |
| `DEADLINE:` | Only for true external deadlines (someone else cares about this date) |

Parent project headings: **no `SCHEDULED:` date** — prevents agenda bleed.

## Well-formed project (Tier 2 inline)

- Parent: `TODO :project:` tag, Goal + Ramification body text
- Exactly **one** `NEXT` subtask with `SCHEDULED:` and `:Effort:`
- Remaining subtasks: `TODO` state, no date
- `:ORDERED: t` when step sequence is strict
- Tier 3 projects: parent links to org-roam node via `id:` link

## Stuck project

A project is stuck when its NEXT SCHEDULED date is in the past and hasn't moved.
Required intervention (not optional rescheduling):
- **Re-activate** — new NEXT + realistic date. Only if genuinely happening this week.
- **PAUSED** — parent state → PAUSED, inline note on why.
- **ABANDONED** — parent state → ABANDONED. Drift is not a state.

## Deadline horizon (14-day scan)

Before touching scheduling, check the near-term deadline window:
- Pull up all items with a `DEADLINE:` in the next 14 days
- For each: is it already `SCHEDULED:` with enough lead time to finish?
- If not: schedule it now, or (if you can't commit) flag it explicitly

A deadline that appears in this scan and has no scheduled work is an overdue decision,
not just an overdue task.

## Overcommitment check

List all `:project:` parent headings in `* Active`. If the count is high, name it —
too many active projects is a system problem, not a scheduling problem.

Between weekly reviews, use your daily planning view's stuck-projects feature for a
quick structural check (no NEXT or DOING subtask). See your Emacs reference for the
keybinding.

## Well-formed Someday item

- One line of **why** — what this would give you
- One line of **what the NEXT would be** — so promotion is immediate

No Effort, no SCHEDULED, no Goal/Ramification framing.

## Well-formed Tickler item

Same minimum as Someday (why + NEXT), plus a `SCHEDULED:` date that means
"review this" not "do this." At the scheduled date: promote, delete, or reschedule.

## WAITING semantics

`WAITING` = blocked on a **person**. If blocked on a condition or event, use `TODO`
with an inline note instead (e.g. "When light falls out, fill out form").

Stale threshold: flag any WAITING item older than one week for follow-up.

## Habit staleness

Flag habits where `SCHEDULED:` date is more than two cycles past. This is a system
maintenance signal, not a personal failure. Likely cause: anchor broke or no longer
fits routine. Intervention: review and replace the anchor, not restart with willpower.

## Someday promotion test

Promote when: *"Do I have a scheduled slot and the motivation to start this in the
next two weeks?"* If unsure, leave it. Premature promotion creates Active debt.

## Effort values

| Value | Meaning |
|---|---|
| `0:15` | Smallest trackable — fits in a gap |
| `0:30` | One Pomodoro |
| `1:00` | One focus block |
| `2:00` | Hard ceiling — if it wants more, decompose it |

For repeating tasks (`.+Xd`): Effort = today's session, not total remaining work.
