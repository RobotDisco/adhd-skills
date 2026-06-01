# Org-mode Conventions

## Required properties

| Property | When required |
|---|---|
| `SCHEDULED:` | Every item in `* Active` |
| `:Effort:` | Every item in `* Active` at the moment of scheduling — not at capture time |
| `DEADLINE:` | Only for true external deadlines (someone else cares about this date) |

Phantom date tags like `:1week:`, `:1month:`, `:6month:` are forbidden — org-agenda ignores
them, giving false confidence the system is tracking something it isn't. Convert to real
`DEADLINE:` or drop.

---

## Effort values

| Value | Meaning |
|---|---|
| `0:15` | Smallest trackable — fits in a gap |
| `0:30` | One Pomodoro |
| `1:00` | One focus block |
| `2:00` | Hard ceiling — if it wants more, decompose it |

**Effort = today's session, not total project size.** For tasks with a `.+Xd` repeater
(ongoing reading, a course, a daily practice), Effort answers "how long am I spending on
this today" — not "how long will this take overall." A book you read in 10 sessions gets
`1:00` per session, not `10:00` total.

Set effort with `C-c C-x e`.

---

## Repeater types

Prefer `.+Xd` (completion-relative) over `++Xd` (fixed-interval) for habit items. If a
session is missed, `.+Xd` reschedules from next completion rather than stacking overdue
entries. Guilt-stacking breaks ADHD systems.

---

## Habit heading conventions

Include a brief inline anchor note below the PROPERTIES block:
- Single line, plain English
- Pre-define fallbacks for uncertain anchors: `X or Y — whichever happens`
- Include reference codes or links needed to execute the habit (e.g. PhysiApp code for physio)

---

## Inline project conventions (Tier 2)

For projects with 2–5 sequential steps that don't need a knowledge node in org-roam:

- Parent heading: `TODO :project:` tag, Goal + Ramification body text
- Add `:ORDERED: t` explicitly when step sequence is strict
- Only the **current step** gets `NEXT` state with `SCHEDULED:` and `:Effort:`
- Remaining subtasks stay as `TODO` with no date — invisible until promoted
- Parent heading has **no `SCHEDULED:` date** — prevents it bleeding into agenda alongside subtasks
- Progress cookie on parent only when the project is long enough to warrant it:
  - `[/]` when count matters (e.g. `[10/18]` chapters done)
  - `[%]` when rough progress is enough
  - Skip for short projects (2–3 steps visible at a glance)

When a NEXT step is done: promote the next TODO to NEXT, add a scheduled date and effort estimate.

---

## Org-roam project pattern (Tier 3)

Org-roam holds **project knowledge**: plans, decisions, notes, references. personal.org
holds **task scheduling**: what's the next thing and when.

Pattern for multi-step projects:
- Project lives in org-roam with `:project:` filetag.
- In `personal.org * Active`, a single `NEXT` headline is the current next action,
  with an `id:` link back to the org-roam project node.
- When that NEXT is done, the project node's plan tells you the next-next action.

Don't migrate org-roam projects wholesale into personal.org — it loses the knowledge graph.

---

## Checkboxes vs TODO headings

**Checkboxes** when steps are sequential, uniform, and not individually schedulable (no
effort/tag/date needed per step). Good for tracking progress within a repeating task.

**TODO headings** when steps need their own scheduling, tags, or effort estimates.

Rule: checkboxes for steps *within* a task, TODO headings for independently schedulable actions.

---

## Jira integration (`jira/*.org`)

Synced by `org-jira-get-issues`; do not hand-edit. When a Jira ticket becomes the actual
next thing to do, create a stub in `personal.org * Active`:

```org
** NEXT Upgrade mailgun exporter [[file:jira/open-tasks.org::CLOUD-1168][CLOUD-1168]] :work:
SCHEDULED: <date>
:PROPERTIES:
:Effort:   1:00
:END:
```

Don't make `jira/` items part of the daily agenda directly — too noisy. Cherry-pick.
