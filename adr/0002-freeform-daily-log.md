# 0002: Freeform daily log over structured evening template

**Date**: 2025-10-17
**Documented**: 2026-05-30
**Status**: Accepted

## Context

The zettelkasten includes an evening template (`templates/evening.org`) designed as a
structured daily reflection ritual: emotion check, wins, gratitude, ADHD-specific prompts.
The template was built with the assumption that a single end-of-day structured review would
be the primary journalling mechanism.

In practice the template was aspirational and never completed. The actual habit that emerged
was freeform bullet entries throughout the day — capturing events, thoughts, and observations
as they happen.

Two design questions emerged from this gap:

1. **Capture timing:** end-of-day reconstruction vs. in-the-moment capture at natural
   breakpoints (pomodoro breaks, mid-day transitions, signoffs).

2. **Emotional awareness:** prompt-driven (template field) vs. intervention at the moment
   of availability (a pause at a natural breakpoint).

## Decision

The primary daily journalling mechanism is **freeform log entries throughout the day**,
not the structured evening template.

Emotional awareness is not prompt-driven. The intervention is the pause itself — noticing
and naming feelings at the moment they are available, not reconstructing them at bedtime
from a template field. The trigger is natural breakpoints, not a scheduled end-of-day form.

The weekly review is the primary processing ritual. The daily log feeds the weekly review;
the weekly review is where fleeting captures get processed into permanent notes or actions.

The evening template remains available for deliberate structured reflection when energy and
context support it — but it is not the system's load-bearing mechanism.

## Alternatives considered

**Structured evening template as primary mechanism** — rejected in practice. End-of-day
energy is low; reconstructing emotional states and wins from memory at bedtime produces
low-quality entries and high skip rates. The template created a completion obligation that
generated shame when unmet, without producing proportional value.

**No daily journalling structure at all** — rejected. Unanchored capture produces no life
record and no feed for the weekly review. The freeform log is still a deliberate practice;
it's the structure that changed, not the commitment.

## Consequences

- The daily journal is the life record and fleeting capture layer. It is not expected to
  be complete, structured, or polished.
- Incomplete entries are better than no entries — the system serves capture, not
  performance.
- The weekly review mines the week's journal entries for permanent note seeds, promotes
  fleeting notes, and checks the GTD system. The daily log feeds this; it does not replace it.
- *(Current implementation: daily journal entries in `notes/journal/YYYY/MM/YYYY-MM-DD.org`,
  freeform bullet entries. The evening template `templates/evening.org` exists but is
  not the load-bearing mechanism — it remains available for deliberate use when energy allows.)*
