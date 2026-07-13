# 0026: Extraction test tuned for recurrence and decision/affect exclusion

**Date**: 2026-07-13
**Status**: Accepted

## Context

`brain-process-notes`' Phase A (journal mining) applies a two-part extraction test from
`references/extraction-test.md`: does a journal fragment have a **claim** and a
**ramification**? The test was written from first principles and had not been checked
against real journal content.

To validate it, two weeks of actual journal entries (2026-06-30 through 2026-07-12) were
mined by hand and cross-referenced — via a subagent inventorying every note file
created or modified in the same window — against what the user had actually captured as
notes. This produced a precision/recall check the test's authors hadn't had before:
what did the test's own logic predict as note-worthy, and did that match reality?

Two real gaps showed up:

1. **Recurring-but-thin fragments were invisible.** The strongest miss across both weeks
   was a theme (AI-generated social interaction vs. the friction of dealing with other
   people) that appeared three separate times — 06-30, 07-01, and 07-12 — each occurrence
   individually thin enough to plausibly fail the claim+ramification test on its own. The
   test as written evaluates each mining session's date range in isolation; it has no
   mechanism for noticing that a fragment dismissed last week is the same fragment
   showing up again. A second theme (avoiding silence via constant media consumption)
   showed the identical pattern across 07-07 and 07-08.
2. **The test had no rule distinguishing a live personal decision from a reusable
   insight.** Several journal fragments technically satisfied claim+ramification — e.g.
   a stated intent to leave the current job as a "survival mechanism" — but the user's
   actual capture behavior *correctly* never turned this into a zettelkasten note. The
   written test had no explicit account of why: nothing separated "a claim whose
   consequence is a decision about right now" from "a claim that would generalize
   outside the situation that produced it." Without a named rule, a literal application
   of the test could over-flag decision-in-progress and affect-processing content as
   note candidates — exactly the kind of journal material [[0023]] already establishes
   should stay in the one-way feed.

## Decision

Two additions to `brain-process-notes/references/extraction-test.md`:

### Recurrence is itself a signal

Before dismissing a fragment as too thin, check recent journal entries (a few weeks
back) for near-repeats of the same theme via `grep`. A recurring fragment is surfaced
explicitly as a pattern — "this is the Nth time you've circled this" — rather than
silently re-evaluated each time as if seen fresh. Recurrence can stand in for a
ramification when no single occurrence states one clearly: the fact that it keeps
returning is the "so what."

This is a targeted grep triggered by a thin-but-familiar-feeling fragment, not a
standing requirement to re-scan multiple weeks on every mining session — it doesn't
change the "confirm the range" step or make Phase A a multi-week operation by default.

### Exclude claims whose ramification is situational, not reusable

Added to "what does NOT clear the bar": a claim about what to do next in an unresolved
personal situation (a job-leaving decision, a relationship reckoning in progress). The
test: **would the claim still be useful or true if the situation resolved differently?**
If not, it belongs in GTD or stays in the journal until it resolves into something that
generalizes.

This doesn't exclude emotional or personal content categorically — a personal
realization that would hold regardless of how the triggering situation resolves still
clears the bar. The exclusion is about generalizability, not about affect.

## Alternatives considered

**Lower the claim/ramification bar generally** — rejected. The misses weren't caused by
the bar being too high; they were caused by evaluating each session in isolation and by
an unstated boundary around decision content. Loosening the bar broadly would fix
neither and would re-open the door to flagging pure log entries.

**Make every mining session scan several weeks back by default** — rejected. Heavier
than the gap warrants, and works against the deliberate, bounded shape of a Phase A
session. Recurrence-checking is a targeted lookup triggered by a specific thin fragment,
not a change to the session's default scope.

**Leave the decision/affect boundary implicit, relying on the "decide together" step to
catch it live** — rejected. The whole point of validating against real behavior was that
the user's live judgment *already* draws this line correctly and consistently — the gap
was that the written rubric didn't say why, so a differently-primed session (or a
different reader of the skill) could re-derive or miss it. Naming the rule is cheaper
than re-litigating it, the same argument [[0023]] made for the journal's linking
boundary.

## Consequences

- `brain-process-notes/references/extraction-test.md` has two new sections: recurrence
  checking (under "Your pass — catching the gap") and the situational-claim exclusion
  (under "What does NOT clear the bar").
- Future Phase A sessions should treat a thin-but-familiar fragment as a cue to grep
  recent entries before deciding to skip it, rather than evaluating it purely against
  the current range.
- The situational-claim exclusion is a generalizability test, not an affect filter —
  applying it correctly requires asking "would this survive the situation resolving
  differently," not "does this sound emotional."
- Validated live the same day: a backfill pass against the two known misses (recurrence)
  produced two new `:permanent:` notes, and a Phase B critique of those notes plus one
  existing `:fleeting:` note caught a real missing link and a title stuck in
  instruction-shape rather than claim-shape — evidence the tuned rubric and the existing
  quality bar ([[0019]]) compose correctly.
- No change to `brain-weekly-review` or its journal-scanning boundary ([[0020]],
  [[0023]]) — this ADR only touches `brain-process-notes`' deliberate mining session.
