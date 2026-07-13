# Journal extraction test

The user's own standing rule, from a permanent note they wrote on this exact question
(`For me, an idea becomes worth turning into a zettelkasten note is when I start to
elaborate on something with a ramification in my journal`):

> An idea becomes worth turning into a note when I start to elaborate on something with
> a ramification — in my journal, whether the source is external or a self-realization.

This maps directly onto criteria 6 and 7 of the seven-criteria bar
(`../../../references/note-quality-criteria.md`): **a claim**, and **a ramification**
(the "so what"). A journal fragment is an extraction candidate when it clears both:

1. **Is there a claim?** Not "X happened" (a log entry) but "X happened, and it means/
   implies/reveals Y" — a self-realization, a position taken, a pattern noticed.
2. **Is there a ramification?** Does the claim change what the writer thinks, does, or
   watches for going forward? A claim with no stated or implied consequence is an
   observation, not yet a note seed.

Both bars are deliberately low — the goal is *elaboration in progress*, not a
publication-ready permanent note. A fragment that clears both is worth capturing as
`:fleeting:` at minimum; one that's already articulated in the writer's own words with a
clear consequence may be worth drafting straight to `:permanent:`.

## What does NOT clear the bar

- **Pure log entries** — "went to the AGO with Sean," "coffee needs replacing." Life
  record, not a note seed. (These stay in the journal; the journal is a one-way feed —
  see the journal boundary section of the shared reference.)
- **Aspiration without a claim** — "I should meditate more," "I should learn Rust." No
  claim, no ramification, just a wish. Naming this gently as decoration (not a note
  candidate) is more useful than silently skipping it — the pattern is worth surfacing
  if it recurs.
- **A claim with no stated consequence and no natural link** — "Coffee needs to be
  frozen because it still ages" is close but thin: it's a claim, and the ramification
  (do this differently) is implicit but real enough — this one clears the bar. Contrast
  with "programming is interesting" — a claim with no consequence at all, nothing
  changes because of it — doesn't.
- **A claim about what to do next in an unresolved personal situation** — a decision
  taking shape in real time ("I should quit X," "I need to end things with Y"). This
  technically has a claim and a ramification, but the ramification is situational: it
  only holds for as long as this specific circumstance does. Test: would the claim still
  be useful or true if the situation resolved differently? If not, it belongs in GTD or
  stays in the journal until it resolves into something that generalizes.

## Check for recurrence

The two-part test above evaluates a fragment against the text in front of you. But some
fragments are thin in isolation and only become a real note candidate in aggregate — a
passing mood, a "vague thought" the writer half-dismisses, that turns out to be the
second or third time something similar has surfaced.

Before dismissing a fragment as too thin, do a quick `grep` across recent journal entries
(a few weeks back is usually enough) for near-repeats of the same theme. If you find one,
say so explicitly rather than silently upgrading or dropping it:

> "This is the [Nth] time you've circled [theme] — first on [date], again on [date]. Each
> one on its own reads thin; together it's a pattern. Worth a note?"

Recurrence can itself be the ramification when no single instance states one clearly —
the fact that it keeps coming back is the "so what."

## Why Claude reads the journal directly here, unlike the weekly-review reflection step

`brain-weekly-review`'s reflection prompts deliberately keep the journal-scanning step
in the user's hands (ADR 0020) — because for that step, the *scanning itself* is the
reflective exercise being protected. Outsourcing it would remove the cognitive work the
ritual exists to build.

Extraction-candidate spotting is a different kind of task: applying a fixed two-part
test (claim? ramification?) to text already written. It's closer to editorial triage
than to self-generated insight. So this skill still asks the user to do a first pass
themselves — that ownership and the practice of applying their own test matters — but
then has Claude read the same range directly, specifically to catch what a first pass
misses: a fragment buried in a long entry, something phrased too quickly to notice, or
a claim the writer is too close to their own day to see as one. Frame anything Claude
finds as a supplement to the user's list, not a replacement for it — and don't relitigate
which mode is "more correct" mid-session; that's a design question already settled here,
not a live one for a mining session to reopen.
