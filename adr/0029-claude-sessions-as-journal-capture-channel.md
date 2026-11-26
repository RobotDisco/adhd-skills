# 0029: Claude sessions are a journal capture channel, and Claude may append approved entries

**Date**: 2026-11-25
**Status**: Accepted

## Context

A growing share of the user's real learning and incident work now happens inside Claude
Code sessions: debugging production systems, investigating tickets, working through
technical questions. Those sessions produce exactly what the daily journal exists to
hold ([[0002]]): what happened, what was learned, which earlier theory turned out to be
wrong. But it happens mid-task, and the context switch out of a session erases it from
working memory. "I'll journal it later" is a plan the system's own design principles say
doesn't work.

The user already journals these sessions by hand. The 2026-11-24 entry for INC-96 is
headed "(summary drafted with Claude after the fact)". So the habit exists. What's
missing is a repeatable way to do it across *all* of a day's sessions, including the ones
the user didn't think to journal in the moment.

Two tensions had to be resolved:

1. **Write access.** `brain-process-notes` forbids Claude from writing anything in the
   brain repo, because drafting notes removes the integration work the zettelkasten
   exists to build ([[0019]], criteria 5–7). Does that rule extend to the journal?
2. **Filtering.** Should session content pass the claim + ramification extraction test
   ([[0026]]) before reaching the journal?

## Decision

A `brain-session-journal` skill reads the day's session transcripts, recommends journal
entries drafted in the user's voice, and **appends the entries the user approves** to
today's journal file.

**Write access is granted narrowly**, and every write only adds text. Approved new
entries go at the end of today's journal file, each heading marked `(drafted with
Claude)`. Approved corrections or additions to an existing entry go at the end of *that
entry*, in whatever day's file holds it, as a dated `- [Update YYYY-MM-DD: …]` block.
That is the user's own convention. Existing lines are never edited or removed, even when
they're now known to be wrong.

Update blocks sit next to the entry they amend because a journal day is reached by its
date ([[0023]]). A correction filed under a different day, with links ruled out, leaves
the overturned claim standing uncorrected wherever a reader actually finds it. This is
[[0024]]'s "evolve by append, not rewrite", applied inside the journal. The rationale for
`brain-process-notes`' no-write rule is protecting *thinking* work. A journal entry is
a *life record* ([[0002]]): its job is to exist, not to be a product of integration. The
integration work still happens later, when `brain-process-notes` mines the journal. The
user does that, and Claude still doesn't write those notes.

**No extraction test at capture time.** The journal is a one-way feed ([[0023]]). This
skill is on the inflow side, so filtering for note-worthiness here would starve the
feed that processing depends on. The capture bar is "worth remembering", defined in the
skill's `references/journal-worthiness.md`.

**Placement in the rituals**: an optional step in the evening sweep, which is already
capture-only ([[0007]]), or on demand at the end of a session.

## Alternatives considered

**Present entries only, user pastes into Emacs** — rejected. Copying multiple org blocks
out of a terminal at 9pm is exactly the kind of low-energy-moment friction that makes a
capture step get skipped. The no-write principle doesn't apply to life-record content,
so the friction buys nothing.

**Skeleton prompts instead of drafted entries** — rejected as the default. Asking the
user to write each entry from a prompt turns a capture step into a reflection exercise,
which ADR 0002 already found fails at end of day. Drafts the user can approve, edit, or
reject keep the user's judgment in the loop at a fraction of the cost.

**Scan only personal projects** — rejected. Work sessions hold career-building learning
and notable incidents, and the journal already contains them ([[0006]] splits *tasks* by
work/personal. It doesn't govern the life record).

**Append automatically via a SessionEnd hook** — rejected. Unreviewed writes to the life
record. They would also run per session, with no view of the whole day and no
deduplication against what the user already wrote.

## Consequences

- The brain repo now has one narrowly scoped place where Claude writes: journal files.
  That means new entries in today's file and update blocks on existing entries, always
  add-only and always after approval. Everything else in `~/Documents/brain` stays
  read-only for Claude.
- Validated against 2026-11-25: a session's in-place `[Update 2026-11-25: …]` blocks on
  the 11-24 INC-96 entry were the motivating example. The first draft of this skill
  would have filed them as a separate heading in the 11-25 file, away from the
  overturned 18:52 theory.
- The `(drafted with Claude)` marker keeps provenance visible. During journal mining,
  a marked entry is Claude's paraphrase. If it becomes a note seed, the "in your own
  words" criterion (#5) still has to be met by the user.
- Entries are written to today's file even when scanning a past day. The heading carries
  the original date and time, so the journal stays date-addressable by when it was written.
- *(Current implementation: `brain/skills/brain-session-journal/`. Transcripts are read
  from `~/.claude/projects/*/*.jsonl` via `scripts/extract-sessions.sh`, which drops tool
  calls, sidechains, and harness-injected messages.)*
