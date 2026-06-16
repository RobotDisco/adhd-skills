# 0015: Project execution layer lives in personal.org alongside tasks

**Date**: 2026-06-01
**Status**: Accepted

## Context

ADR 0004 established the two-layer model: a knowledge layer (for thinking) and an
execution layer (for doing). It did not specify where the execution layer lives.

Two structural options were considered:

1. **Separate project tracker file** — projects live in a dedicated file, single tasks
   live in the daily task file. Clean separation; adds a file to navigate.

2. **Unified task file** — projects and single tasks live in the same file. Projects
   are distinguished by a tag, not by file location.

## Decision

The execution layer for all projects lives in the **same file as single tasks**, not a
separate project tracker.

Projects are identified by a tag (`:project:`), not by file location. This makes
overcommitment visible at a glance — all active commitments (single tasks and projects)
are in one place. It also enables a "stuck projects" view that scans the same file as
the daily agenda.

## Alternatives considered

**Separate project tracker file** — rejected. Adds navigation friction (two files to
check during planning and review). Overcommitment requires cross-file reasoning. The
tag-based distinction within a single file achieves the same visual separation without
the friction.

**Projects in org-roam notes** — rejected (per ADR 0010). org-roam notes are the
knowledge layer; they are not task schedulers and don't surface in the daily agenda.

## Consequences

- All active commitments are visible in one agenda view — single tasks and project
  parents together. Overcommitment is immediately apparent.
- A stuck-projects view can scan the same file as the daily agenda.
- The task file grows as projects accumulate. Completed/abandoned projects should be
  archived regularly to keep it navigable.
- *(Current implementation: `personal.org * Active` in Emacs. Projects are `:project:`
  tagged headings; single tasks are untagged headings at the same level.)*
