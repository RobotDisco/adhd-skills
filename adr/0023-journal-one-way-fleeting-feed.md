# 0023: The journal is a one-way fleeting feed — linking is a graph rule, not a journal rule

**Date**: 2026-06-21
**Status**: Accepted

## Context

The daily journal is the life-record and fleeting-capture layer (cf. [[0007]]'s evening
sweep; mined in [[0018]]'s weekly review). A question keeps resurfacing *during* review:
should journal entries be wired into the zettelkasten graph — links between consecutive
days, or back-links from an extracted permanent note to the journal entry it came from?

The pull is real because [[0019]] makes link-discoverability a first-class obligation: an
unlinked permanent note "functionally doesn't exist," so the instinct is to apply the same
discipline everywhere. Left unstated, the question gets re-litigated every few weeks — each
time costing the same re-derivation, and each time tempting an open-ended "link all my days
together" project that is pure system-tweaking (the ADHD failure mode of reorganizing
instead of processing).

## Decision

The journal is a **one-way feed**. Value flows *out* of it into the permanent graph during
weekly review; the entry then remains as a dated husk — a life record kept *after* its
capture value has been extracted, not a node to be cultivated.

Linking discipline is therefore **asymmetric**:

- **Permanent / literature graph** — links are first-class. Object permanence applies
  ([[0019]]): an unlinked note doesn't exist, so connections are worth the investment.
- **Journal** — links are *not* a practice. Don't link days to each other; don't back-link
  extracted notes to their journal origin.

Forward links (a journal entry pointing at a note it produced) are *permitted* as an
optional "this got processed" marker, but they are not a discipline to maintain and carry no
obligation.

The justification is that the object-permanence problem links solve in the graph **does not
exist for the journal**, because journal entries are already discoverable by two means the
graph notes lack:

- **Date-addressable** — entries live at `YYYY/MM/YYYY-MM-DD.org`; you reach them by *when*,
  not by *what links to them*.
- **Full-text-searchable** — grep/ripgrep over the journal recovers any content directly.

Graph edges exist to make ideas findable when you *don't* know where they live. Journal
content always has a known coordinate (its date) plus content search, so linking effort buys
discoverability you already have — cost without payoff.

## Alternatives considered

**Treat journal entries as first-class linkable nodes** — rejected. Maintenance cost with no
discoverability gain (entries are already date- and text-addressable). It also invites the
"link all my days together" project, which is system-tweaking dressed as knowledge work.

**Back-link every extracted note to its journal origin** — rejected. The journal entry is a
spent husk once mined; pointing a durable permanent note back at it adds noise, not value.
The provenance that matters (a real source) lives in `:ROAM_REFS:`, not in a fleeting log.

**Leave the rule unstated (status quo)** — rejected. This ADR exists *because* the question
recurred during review and was re-derived from scratch each time. An unwritten boundary is a
standing tax.

## Consequences

- Weekly review ([[0018]]) is the *only* point where the journal connects to the graph, and
  it does so by **extraction** (promoting atoms into the permanent layer), not by linking.
- Object permanence ([[0019]]) is hereby scoped: it is a property of the *permanent graph*,
  not of every `.org` file in the repo.
- Decision heuristic when unsure whether content belongs in the graph or just reachable from
  it: if it's date-indexed and searchable, a link adds nothing — leave it in the journal.
- `brain/CLAUDE.md`'s daily-journalling section describes the journal as a fleeting feed but
  does not state this linking rule; it can point at this ADR if the question recurs.
