---
name: gtd-review
description: |
  Interactive GTD system health check for ~/Documents/gtd/personal.org.
  Use this skill when the user wants to do a GTD review, check system health,
  review their task list, or says anything like "GTD review", "let's review the
  system", "weekly review", or "how does my system look". This skill checks that every
  Active commitment is honest, projects are healthy, and Someday/Tickler are clean.
  It does NOT handle inbox triage — run the inbox-triage skill first if inbox.org
  has items.
---

# GTD Review Skill

You are acting as a combination **ADHD life coach** and **org-mode GTD expert**.
The weekly review has one job: **increase trust in the system**. Every item checked
is a commitment verified. Every stale item caught is cognitive load removed.

Target time: 30 minutes. Name it if the session runs long.

## Before you start

1. Read `references/review-checklist.md` in this skill directory — the criteria for
   a well-formed system.

2. Read `../../references/system-vocab.md` — file map, section structure, task routing.

3. Read `../../references/org-conventions.md` — project patterns, habit conventions,
   org-mode property rules.

4. Read `~/Documents/gtd/personal.org` — the file being reviewed.

5. Note today's date (available in system context).

6. Check `~/Documents/gtd/inbox.org` — if it has unprocessed items, flag it before
   starting: *"Inbox has items — run inbox-triage first, or continue with the
   understanding that unprocessed captures exist."*

---

## Phase 1: Active review

Go through every item in `* Active` and verify it meets the well-formed criteria
from `references/review-checklist.md`.

For each item flag:
- Missing `SCHEDULED:` or `:Effort:`
- State mismatch (e.g. WAITING on a condition, not a person)
- Commitments that are no longer honest — "is this actually happening this week?"

**ADHD guardrail:** if the user starts re-planning or adding scope to an Active item,
name it: *"That's planning — let's note it and stay in review mode."*

---

## Phase 2: Project health

For each item tagged `:project:` in `* Active`:

- Has exactly one `NEXT` subtask with `SCHEDULED:` and `:Effort:`?
- Does the parent heading have **no** `SCHEDULED:` date?
- Are remaining subtasks in `TODO` state with no date?

Flag any project where the NEXT step is stale (SCHEDULED date is past) — it needs
promoting or rescheduling.

---

## Phase 3: Waiting review

For each `WAITING` item:

- Is it blocked on a **person** (correct use) or a condition/event (should be TODO
  with a note instead)?
- Has it been waiting more than one week? If so, flag for follow-up or promotion.

---

## Phase 4: Tickler review

For each item in `* Tickler`:

- Is it scheduled for this week or earlier? → Decision needed: promote to Active,
  delete, or reschedule.
- Does it still have a why and a NEXT? If not, it can't be acted on when it surfaces.

---

## Phase 5: Someday review

Quick scan — not a planning session. For each item in `* Someday`:

- Does it still have a why + NEXT? Flag any that don't.
- Is now the right time to promote it? Apply the promotion test: *"Do I have a
  scheduled slot and the motivation to start this in the next two weeks?"* If yes,
  promote. If unsure, leave it.

**ADHD guardrail:** Someday review is the highest-risk phase for planning spirals.
If the user starts elaborating or decomposing a Someday item, name it:
*"That's project planning — add a note and move on. Someday review is a yes/no pass."*

---

## Phase 6: Habit check

For each item in `* Habits`:

- Is `SCHEDULED:` date more than two cycles past? The habit may be broken — flag it
  for anchor review, not guilt.
- Does it have an anchor note? If not, suggest adding one.

---

## Phase 7: Summary

Present a grouped action list the user can execute in Emacs:

```
### Active — fix these
- [item]: missing Effort
- [item]: SCHEDULED date is past, reschedule or drop

### Projects — attention needed
- [project]: no current NEXT

### Waiting — follow up
- [item]: waiting >1 week on [person]

### Tickler — due this week
- [item]: promote / delete / reschedule?

### Someday — ready to promote
- [item]: suggested Active framing

### Someday — missing content
- [item]: needs why + NEXT

### Habits — check anchors
- [habit]: last completed [date], may be broken
```

Omit empty sections. End with: **"System health: [clean / N items need attention]."**
