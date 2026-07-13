# 0028: `:archive:` kept as an honest stopgap for missing retro-closure discipline

**Date**: 2026-07-13
**Status**: Accepted

## Context

During the retroactive tag sweep ([[0027]]), `:archive:` (5 notes) turned up alongside
the other undocumented tags. Unlike the ones dropped in that sweep, it doesn't fit the
mass/handling-distinction test cleanly — it isn't a topic label riding along on another
tag, and it isn't trying to clear the facet gates at all. Sample usage:

- `HBC Gift Registry` — `:archive:tulip:`
- `Anything Tony brings up is a good candidate for a possible problem to solve` — `:archive:tulip:`
- `Historical Career Feedback` — `:archive:`
- `Google Cloud Source Repositories` — `:archive:`

What it actually marks: content that's stale or no longer relevant, without having gone
through a proper closure process. The user's own framing was direct — it exists mostly
because project retro sweeps ([[0011]]) don't yet happen reliably, and `:archive:` is
what catches the notes that should have been closed out properly but weren't.

## Decision

Keep `:archive:` as a **status overlay**, independent of both the function and entity
axes — it can sit alongside any lifecycle tag, or none, since it marks staleness, not
kind.

Its justification is explicitly conditional, not evaluated against [[0025]]'s usual
two-gate test: it's a documented workaround for a missing habit (reliable `:project:`
retro/closure), not a permanent design choice. It's kept because naming the gap honestly
is more useful right now than pretending the closure discipline already exists.

## Alternatives considered

**Decline `:archive:` until the retro-sweep habit actually exists** — considered.
Rejected because the honest state of the practice is that closure doesn't reliably
happen yet, and a tag that names the gap plainly is more useful than pretending the
discipline is already in place.

**Evaluate `:archive:` against the standard two-gate test ([[0025]])** — rejected as the
wrong frame. It isn't a topic/facet at all; forcing it through the facet test would
either fail it for the wrong reason or manufacture a fake "handling distinction" the way
[[0027]] explicitly declined to do for the dropped tags.

## Consequences

- `note-quality-criteria.md` and `brain/CLAUDE.md` document `:archive:` as a status
  overlay, separate from both axes and from the facet system.
- This ADR's reasoning is explicitly time-bound: if `:project:` retros become reliable,
  revisit whether `:archive:` is still needed, or whether proper `COMPLETED`/`ABANDONED`
  closure makes it redundant.
