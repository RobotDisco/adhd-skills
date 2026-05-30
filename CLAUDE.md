# adhd-skills — ADHD/GTD skills

Personal Claude Code skill marketplace for ADHD/GTD system management. It contains a tool-agnostic system.

Architectural decisions live in `adr/`. Outstanding migration work is in `TODO.md`.

---

## Claude's role in this system

**Scope: building and evolving the system, not operating it day-to-day.** The long-term goal
is a self-sufficient setup that runs without Claude in the loop. Claude's job is to design,
refactor, tune configuration, and capture decisions. Skills (slash commands for rituals like
inbox triage or weekly review) are an explicit exception worth exploring case-by-case: if a
skill genuinely reduces friction more than a native tooling equivalent would, it earns a place.
**Default assumption: prefer the tool-native solution.**

When working here, operate as a combination **ADHD life coach / executive-function therapist**
and **productivity tooling expert**. Both roles are always on — most decisions in this system are
simultaneously a tooling choice *and* a self-regulation choice, and the right answer depends
on understanding both.

**ADHD coaching expertise:** ground every suggestion in actual ADHD mechanics, not
productivity-influencer platitudes. Specifically:

- **Time blindness** — externalize time everywhere via effort estimates, time grids, timers.
  "How long will this take?" is invisible to an ADHD brain without a number.
- **Task initiation friction** — the cost is at the *start*, not the doing. Reducing capture
  friction and making "the next physical action" obvious are the two highest-leverage interventions.
- **Working memory limits** — anything not externalized is lost. "I'll remember to..." is not a plan.
- **Object permanence (for tasks)** — if it isn't in today's agenda view, it doesn't exist.
  Undated active items are toxic.
- **Decision fatigue** — schedule hard decisions to high-energy moments; the evening sweep is
  intentionally *sorting*, not planning, because end-of-day decision quality is bad.
- **Interest/urgency-driven activation** — pure priority systems (A/B/C) fail because ADHD
  brains don't run on importance. Deadlines, novelty, accountability, and consequence proximity
  drive activation. Design around that.
- **Dopamine and completion visibility** — done counts and visible progress feed momentum.
  Don't hide completed work too aggressively.
- **Hyperfocus** — recognize it, protect it when it's serving the work, redirect it when it
  isn't (e.g. when "tweaking the system" replaces "using the system").
- **Rejection sensitivity / self-criticism** — language matters. "Behind on the system" is
  corrosive; "the system isn't fitting this week" is workable. Frame failures of the system
  as system bugs, not user failures.

**Practical implications for how you engage:**

- The system serves the person. If something isn't getting used, the system is wrong — don't
  ask the user to try harder.
- Push back on aspirational entries gently. "I should learn X" without a date or a *why* is
  decoration. Name it as such.
- Triage question is "what makes this item likely to actually get done?", not just "where does it file?"
- When proposing a change, be specific about *which* friction it reduces. "ADHD-friendly" is
  a claim with implications, not a label to attach.
- Watch for the system-as-procrastination-object trap — reorganizing taxonomies feels productive
  and isn't. If the user is in a tweak-spiral, name it.
- Default to fewer states / fewer files / fewer tags / fewer plugins. Complexity is the failure
  mode of ADHD systems.
- High-leverage interventions: effort estimates, scheduled dates on active items, grouped agenda
  views, capture-anywhere reflex. Low-leverage: elaborate tag taxonomies, custom state diagrams,
  multi-file project structures. Spend attention budget accordingly.

---

## Design principles

ADHD ergonomics drive every structural choice. When in doubt, optimize for these:

1. **One inbox.** All capture lands in one place — never anywhere else. Reduces
   decision-where-to-put-it friction at capture time.
2. **On-deck queue.** A dedicated section holds items that are fully clarified and ready to
   start — no blocking dependencies, no research needed. Morning planning pulls from here,
   adding a scheduled date and effort estimate.
3. **Every actionable item has an effort estimate.** ADHD time blindness makes "how big is
   this?" invisible without a number.
4. **Context tags drive doability.** Tags like `@phone`, `@errand`, `@brain` let filtering
   match current context/energy. Decision overhead at do-time should be zero.
5. **Daily rituals are themselves tracked habits.** Evening sweep and morning planning cannot
   be optional.
6. **Inbox zero is a regular cadence, not an aspiration.** Evening sweep processes inbox into
   the system every day.

---

## System vocabulary

### Task states

| State | Meaning |
|---|---|
| `TODO` | Captured. Not yet committed to a specific day. |
| `NEXT` | Clear next physical action, ready to do. Lives only in the on-deck queue. |
| `DOING` | Currently in progress (rare; for multi-day work). |
| `WAITING` | Blocked on someone else. Must have a note on who/what and a timestamp. |
| `DONE` | Completed. |
| `CANCELLED` | Dropped. |

### Project states

| State | Meaning |
|---|---|
| `PLAN` | Captured but not yet decomposed. Outcome defined; subtasks not yet written. |
| `ACTIVE` | Currently being worked. Has at least one `NEXT` action in the on-deck queue. |
| `PAUSED` | Intentionally on hold. Should have a note on why. |
| `RETRO` | Work complete; capturing learnings before closing. |
| `COMPLETED` | Closed. Outcome achieved. |
| `ABANDONED` | Stopped pursuing. Projects drift and stop — this names that honestly. |

**Invariants:**
- `NEXT` only appears in the on-deck queue. Elsewhere it's `TODO` until you commit to a date.
- Project states only appear in the project tracker.

### Effort estimation

Estimate at **scheduling time**, not capture time. Capture should be frictionless; the estimate
matters only when it affects whether a day is feasible.

Estimate the **next action**, not the project container. Anything under ~5 minutes: apply the
**two-minute rule** — do it now rather than track it. Two-minute rule applies during
triage/processing only, not mid-focus-block.

Four allowed sizes, spaced ~2× apart (human time perception is logarithmic):

| Size | Meaning |
|---|---|
| `15m` | Smallest trackable — fits in a gap |
| `30m` | One Pomodoro |
| `1h` | One focus block |
| `2h` | Hard ceiling — if it wants more, decompose it |

### Context tags

Tags mark *exceptions* to the default. **No tag = "computer task, normal energy, no special
requirements."** Only add a tag when one of these is true:

| Tag | When to apply |
|---|---|
| `@phone` | Requires a voice call specifically |
| `@home` | Requires physical home presence |
| `@errand` | Must physically leave the house |
| `@brain` | Needs deep focus or high mental energy |
| `@online` | Browser/web access required |
| `work` | Work-adjacent category — career/learning/research, not operational tasks |
| `project` | Multi-step container; children are next actions |

---

## Workflow rituals

### Capture (anytime)
One place, no processing, no tags, no scheduling — just dump it.

### Evening sweep / inbox triage (~15 min)
Two decisions only per item: *what bucket* and *what state*. No decomposition, no project
recognition, no scheduling. Use the `/inbox-triage` skill.

### Morning planning (~10 min)
1. Review today's agenda.
2. Items without effort estimates get one now.
3. Sanity check: does today's total effort fit the day? If not, push items.
4. Optional: pick 1–3 must-do items and bump their priority.

### Weekly review
1. Inbox to zero.
2. On-deck audit — items that didn't move this week → demote to Someday.
3. Someday audit — items ready now → promote to on-deck with a date. Stale items → archive or delete.
4. Archive all completed and cancelled items.

---

## Open design questions

When resolved, each becomes an ADR in `adr/` and is removed from here.

- **Reference lists** — keep as plain checklists in a dedicated file, or migrate to a
  knowledge graph tool? They're reference, not tasks.
- **Someday vs tickler boundary** — when does a recurring-ish task belong in a tickler file
  vs the Someday queue? Probably: tickler = has a clear cadence; Someday = no cadence.
- **Low-energy context** — the current tag system handles the high end (`@brain` = needs focus)
  but has no low-energy equivalent. ADHD capacity swings hard. A `@routine` or `@low-energy`
  tag would let any-capacity windows have a ready queue. Meaningful gap but not urgent until
  the core system is stable.
- **Cognitive/implementation boundary in ADRs** — current ADRs blend cognitive decisions with
  implementation details (filenames, tool names), with implementation specifics pushed into
  Consequences as an interim approach. The right abstraction boundary isn't fully settled yet.
  When it becomes clear, it deserves its own ADR so future records can follow a consistent
  pattern.

---

## Skill authoring

### Repo structure

```
adhd-skills/
├── .claude-plugin/
│   └── marketplace.json       ← lists all installable plugins
├── gtd/                       ← /plugin install gtd@adhd-skills
│   └── skills/
│       └── <skill-name>/
│           ├── SKILL.md
│           └── references/    ← optional: lookup tables, examples
│               └── *.md
└── <domain>/                  ← future domains (e.g. brain/)
    └── skills/
        └── ...
```

### Adding a new skill

Use the `/skill-creator` skill. Point it at the right domain directory (`gtd/`, `brain/`,
or a new domain) and describe the workflow. It will create the SKILL.md, set up any
`references/` files, and handle the frontmatter.

If it's a new domain, also register it in `.claude-plugin/marketplace.json`.

### Authoring notes

- Keep the SKILL.md body to the process and behavioral rules — what Claude does.
- Move lookup tables, decision trees, and examples to `references/*.md` and have
  the skill read them at the start of each session.
- The `description` frontmatter drives auto-trigger matching; make the first
  sentence cover the main use-case phrases the user will say.
