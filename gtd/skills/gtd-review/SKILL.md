---
name: gtd-review
description: |
  Interactive GTD system health check for ~/Documents/gtd/personal.org.
  Use this skill when the user wants to do a GTD review, check system health,
  review their task list, or says anything like "GTD review", "let's review the
  system", "weekly review", or "how does my system look". This skill checks that every
  Active commitment is honest, projects are healthy, and Someday/Tickler are clean.
  It does NOT handle inbox triage — run the gtd-triage skill first if inbox.org
  has items. It also does NOT include the brain/zettelkasten step — the full weekly
  review order is: gtd-triage → gtd-review (this skill) → brain-weekly-review.
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
   starting: *"Inbox has items — run gtd-triage first, or continue with the
   understanding that unprocessed captures exist."*

---

## Phase 1: Deadline horizon scan (14-day)

Run this before any scheduling decision in the phases that follow (ADR 0016) — a
deadline with no scheduled lead time is an overdue *decision*, not just an overdue task.

- Pull up every item with a `DEADLINE:` in the next 14 days.
- For each: is there a scheduled `NEXT` with enough lead time to actually finish it?
- If not: schedule it now, or flag it explicitly for the summary.

---

## Phase 2: Routine / Habits audit

For each item in `* Routine`:

- Is the `LAST_REPEAT` date more than two cycles past? The habit may be broken — flag
  it for anchor review, not guilt. Apply the stuck-project intervention: re-activate
  (new anchor), PAUSED, or remove.
- Does it have an anchor note? If not, suggest adding one.
- No stale habits should sit silently in Routine.

---

## Phase 3: Tickler review

For each item in `* Tickler`:

- Is it scheduled for this week or earlier? → Decision needed: promote to Active,
  delete, or reschedule.
- Does it still have a why and a NEXT? If not, it can't be acted on when it surfaces.

---

## Phase 4: Active board review

### 4a. Single actions (NEXT / DOING / WAITING)

For each non-project item in `* Active`:

- Is this still a real commitment? If not, demote to Someday or delete.
- `DOING` items: still in flight? If stalled, back to NEXT or demote.
- `WAITING` items: still blocked? Can it be unblocked this week? Flag any WAITING
  older than one week for follow-up.
- Does it have `:Effort:`? If not, suggest one.

Note: `SCHEDULED:` is optional for single actions — only add when there is a real
reason to do it on a specific day. Bare NEXTs are pulled into org-timeblock on demand.

### 4b. Project health

**First: overcommitment check.** List every `:project:` item in `* Active`. If the
count is high, name it — too many active projects is a system problem.

**Second: RETRO projects — check these first.** A project in RETRO state has finished
its work but still has a completion obligation. These are closest to done.

For each RETRO project:
- Has a `NEXT` for the retro work? If yes: is it scheduled? If not, schedule it now.
- If no NEXT: create one. RETRO without a NEXT is stuck.
- Once retro NEXT is done → mark project COMPLETED.

**Then, for each remaining project:**

- Has at least one `NEXT` sub-item? If not, the project is stuck.
- Does the parent heading have a Goal and Ramification in the body text?
- Does the parent heading have **no** `SCHEDULED:` date? (prevents agenda bleed)
- (Deadlines already covered in Phase 1 — no need to re-check here.)

**Stuck project check:** if no NEXT exists, or the NEXT is stalled, an explicit
decision is required — not a reschedule by default:
- **Re-activate:** new NEXT. Only if it's actually happening this week.
- **PAUSED:** mark parent PAUSED with a note on why.
- **ABANDONED:** mark ABANDONED. Drift is not a state.

**ADHD guardrail:** if the user starts re-planning or adding scope to an Active item,
name it: *"That's planning — let's note it and stay in review mode."*

---

## Phase 5: Someday review

Quick scan — not a planning session. For each item in `* Someday`:

- Is now the right time to promote it? Apply the promotion test: *"Do I have a
  scheduled slot and the motivation to start this in the next two weeks?"* If yes,
  promote **and set `SCHEDULED:` to sometime this week** — promoting without a date
  doesn't count as done (ADR 0009). If unsure, leave it.
- Anything that will never happen → delete.

**ADHD guardrail:** Someday review is the highest-risk phase for planning spirals.
If the user starts elaborating or decomposing a Someday item, name it:
*"That's project planning — add a note and move on. Someday review is a yes/no pass."*

---

## Phase 6: Housekeeping

- Delete DONE items from `inbox.org` (not archived — Seafile file history is the safety net).
- Archive DONE/CANCELLED items from `* Active` via `org-archive-subtree`.
- Resolve and delete any `SFConflict` files in `~/Documents/gtd/`.

---

## Phase 7: Honest commitment check


After all passes: scan Active one more time. Is everything there something genuinely
being worked on this week or next? If the list still feels too large, demote without
guilt. Active should create clarity, not anxiety.

**Completion gate (ADR 0009):** the review isn't done when every item has been audited —
it's done when there's a concrete pool of Active items scheduled somewhere this week.
Confirm: did every promoted Someday item get a `SCHEDULED:` date, and does every
non-PAUSED project have at least one `NEXT` that's actually scheduled this week, not
just present? A review that leaves this unconfirmed hasn't finished its job even if
every phase above ran clean.

---

## Phase 8: Summary


Present a grouped action list the user can execute in Emacs:

```
### Routine — attention needed
- [habit]: last completed [date], anchor may be broken

### Tickler — due this week
- [item]: promote / delete / reschedule?

### Someday — ready to promote
- [item]: suggested Active framing

### Active — fix these
- [item]: missing Effort
- [item]: DOING but stalled — back to NEXT or demote?

### Projects — attention needed
- [project]: no current NEXT
- [project]: missing Goal/Ramification

### Waiting — follow up
- [item]: waiting >1 week on [person]

### Housekeeping
- inbox.org: N DONE items to delete
- Active: N DONE/CANCELLED items to archive
- SFConflict files: list if any
```

Omit empty sections. End with: **"System health: [clean / N items need attention]."**

This is the GTD-only portion of the weekly review. Per ADR 0020, it isn't the end of the
ritual — continue into the `brain-weekly-review` skill in the same session (it runs
last, as a lighter "landing" phase after this heavier audit). Don't stop here and treat
the week's review as complete.
