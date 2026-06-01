# 0001: Inbox archival policy

**Date**: 2026-05-26
**Status**: Accepted

## Context

The inbox is the single capture point — everything lands here unprocessed. When items are
triaged and marked done (completed during or shortly after capture), a decision is needed:
archive them for history, or delete them outright.

The common pattern in task systems is to archive completed items so history is preserved.
However, the inbox is a staging area, not a project file — items that pass through it are
either actioned and tracked elsewhere, or discarded. There is no meaningful history to
preserve for "captured and immediately resolved" items.

## Decision

Completed items in the inbox are **deleted**, not archived.

## Alternatives considered

**Archive completed inbox items** — rejected. An archive for an inbox creates maintenance
overhead (periodic pruning, extra file to sync) for no practical benefit: the items have no
future reference value, and their absence from completion counts doesn't hide meaningful
work history.

## Consequences

- Deletion is always the correct action when the triage skill encounters completed items
  in the inbox.
- File sync or version history serves as the safety net if a deletion is ever regretted.
  *(Current implementation: Seafile file history.)*
- Periodically completed items from ongoing work (habits, recurring tasks) should not live
  in the inbox — they belong in their home files where archival *is* appropriate.
