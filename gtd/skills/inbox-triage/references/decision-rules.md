# GTD Triage Decision Rules

## Routing decision hierarchy

| Signal | Classification |
|---|---|
| Already done / blocked on someone else | WAITING or delete |
| Single physical action, doable this week | **Single action → Active** |
| Expected deadline but date unknown | **Someday + spin off Active item: `NEXT Find out [deadline]`** |
| Operational work (Jira, sprint, Tulip-specific, SRE/on-call) | **→ Sunsama** |
| Career development, learning, research, skill-building (work-adjacent) | **Someday + :work:** |
| Pure knowledge exploration, no committed outcome | **Brain note (fleeting)** — rare in inbox |
| Recurring with clear cadence | **tickler.org** |
| Not actually going to happen | **Delete** |
| Everything else | **Someday** |

Do not tag `:project:` during triage. Triage has two decisions only: *what bucket* and *what state*.

---

## Context tags

Context tags mark *exceptions* to the default state. **No context tag = "computer task, normal
energy, no special requirements."** Only add a tag when one of these is true:

| Tag | When to apply |
|---|---|
| `@errand` | Must physically leave the house |
| `@home` | Requires physical home presence — not just laptop-at-home |
| `@phone` | Requires a voice call specifically (not Slack/email) |
| `@brain` | Needs deep focus or high mental energy |
| `:work:` | Work-adjacent category (career/learning/research) — routing signal, not a context |

---

## Effort estimates

Only for items going to `* Active`. Someday items don't need one — estimate at scheduling time.

Allowed values: `0:15` · `0:30` · `1:00` · `2:00`

- Under ~5 min → suggest "just do it now" (two-minute rule)
- Over `2:00` → flag as a project instead

---

## Org-mode examples

```org
* NEXT give holy water to mum               :@errand:
  SCHEDULED: <2026-05-28 Wed>
  :PROPERTIES:
  :Effort: 0:15
  :END:
```

```org
* TODO Decide on next techtalk               :work:
  ;; spin off: * NEXT Find out techtalk due date :@phone:
  ;; promote parent to Active + DEADLINE once date known
```

```org
* TODO Learn Qualys API / automate PCI toil  :work:
```

```org
* TODO write cron to test UPS
  ;; no context tag — default computer task
```
