# 0014: Daily journalling practice

**Date**: 2026-06-16
**Status**: Accepted

## Context

The brain repo includes an `evening.org` capture template with structured prompts
(emotion check, wins, gratitude, ADHD-specific reflection). The intent was to close
each day with a deliberate reflection ritual. In practice, the template is never
completed — the prompts are too demanding for end-of-day energy.

A separate habit has emerged organically: freeform bullet log entries made throughout
the day, capturing events, thoughts, and observations as they happen. This is the
de facto daily practice.

The question is whether to fix the template (lower the friction, shorten the prompts)
or accept the freeform log as the actual system and design around it.

## Decision

**The freeform daily log is the real daily practice. The evening template is not.**

The daily log — bullets captured throughout the day in journal files — serves as the
life record and fleeting capture layer. It is not processed daily; it feeds the weekly
review, which is where actual synthesis happens.

Emotional awareness is not prompt-driven in this system. The intervention is the
*pause*, not the *field*. The right trigger for emotional noticing is natural
breakpoints in the day (pomodoro breaks, mid-day log entries) — not an end-of-day
template. The goal is to notice and name feelings at the moment they are available,
not reconstruct them from memory at bedtime.

The weekly review is the primary processing ritual: mine the week's log entries for
permanent note seeds, promote fleeting notes, check GTD.

## Alternatives considered

**Fix the evening template (shorter prompts, lower bar)** — not rejected outright, but
not pursued. The template's failure is structural: end-of-day executive function is too
depleted for prompt-driven reflection. A shorter template still requires initiation at
the wrong moment. The freeform log succeeds precisely because it has no initiation cost
at capture time.

**Both practices in parallel** — rejected. Running two journalling systems adds
maintenance overhead and decision cost ("which one do I use for this?"). The freeform
log already captures everything the template was designed to capture; it just distributes
the capture throughout the day instead of concentrating it at the end.

**Prompt-driven emotional check-ins at midday instead of evening** — not rejected.
This is a potential future intervention for improving emotional awareness in the moment.
Not implemented yet.

## Consequences

- Journal files in `~/Documents/brain/notes/journal/` are freeform log entries, not
  structured templates. No org-mode properties, no fill-in fields.
- The `evening.org` template remains in `templates/` but is not part of the active system.
  Do not suggest using it; do not delete it.
- The weekly review's reflection prompts (in `brain-weekly-review`) are the structured
  reflection layer — once a week, not nightly.
- The weekly review instruction "scan this week's journal entries before answering
  reflection prompts" is load-bearing: the freeform log provides the raw material;
  the user synthesises it themselves during the review.
